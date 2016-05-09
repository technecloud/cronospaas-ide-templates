package reports.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.sql.Connection;
import java.util.Base64;
import java.util.Map;
import java.util.UUID;

import net.sf.dynamicreports.adhoc.AdhocManager;
import net.sf.dynamicreports.adhoc.configuration.AdhocConfiguration;
import net.sf.dynamicreports.jasper.builder.JasperReportBuilder;
import net.sf.dynamicreports.report.exception.DRException;
import util.Functions;
import util.GsonSingleton;

/**
 * Implementação do processo de impressão de relatórios criados com o módulo Ad-hoc.
 */
class AdhocPrintReport implements PrintReport {

	@Override
	public String getPDF(InputStream inputStream, Connection connection, Map<String, Object> parameters) {
		File pdf;
		try {
			pdf = File.createTempFile(UUID.randomUUID().toString(), ".pdf");
		} catch (IOException e) {
			throw new RuntimeException(e);
		}

		FileOutputStream outputStream;
		try {
			outputStream = new FileOutputStream(pdf);
		} catch (FileNotFoundException e) {
			throw new RuntimeException(e);
		}

		if (connection != null) {

			AdhocConfiguration configuration;
			try {
				configuration = AdhocManager.loadConfiguration(inputStream);
			} catch (DRException e) {
				try {
					outputStream.close();
				} catch (Exception ex) {
					// NoCommand
				}
				throw new RuntimeException(e);
			}

			net.sf.dynamicreports.adhoc.configuration.AdhocReport report = configuration.getReport();
			String jsonProperty = report.getProperty(ReportConstants.ADHOC_REPORT_PROPETIES);

			AdhocReportProperty adhocReportProperty = GsonSingleton.INSTANCE.get().fromJson(jsonProperty, AdhocReportProperty.class);

			String query = adhocReportProperty.getSql();
			if (Functions.isExists(query) && !("select *".equalsIgnoreCase(query))) {

				// TODO Será criada uma definição para quando o usuário escolher Zero registros, imprimir todos...
				query = query.concat(" limit $P{DATA_LIMIT}");

				try {
					JasperReportBuilder jasperReportBuilder = net.sf.dynamicreports.adhoc.AdhocManager
							.createReport(adhocReportProperty.newAdhocReport(), new CronosAdhocReportCustomize());

					// Define os parametros em si, dentro do relatório...
					jasperReportBuilder.addParameter("DATA_LIMIT", ReportConstants.DATA_LIMIT);

					// TODO Definição temporario do limite de dados...
					parameters.put("DATA_LIMIT", ReportConstants.DATA_LIMIT);

					// Define os valores dos parametros...
					jasperReportBuilder.setParameters(parameters);

					jasperReportBuilder.setDataSource(query, connection);
					jasperReportBuilder.toPdf(outputStream);
				} catch (Exception e) {
					throw new RuntimeException(e);
				}
			}
		}

		java.nio.file.Path path = Paths.get(pdf.getAbsolutePath());

		byte[] data;
		try {
			data = java.nio.file.Files.readAllBytes(path);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}

		return Base64.getEncoder().encodeToString(data);
	}
}
