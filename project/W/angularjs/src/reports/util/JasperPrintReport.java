package reports.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Base64;
import java.util.Map;
import java.util.UUID;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRQuery;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.design.JRDesignQuery;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import util.Functions;

/**
 * Implementação da impressão de impressos e relatórios criados com o editor manual Jasper Reports.
 */
class JasperPrintReport implements PrintReport {

	@Override
	public String getPDF(InputStream inputStream, Connection connection, Map<String, Object> parameters) {
		File pdf;
		try {
			pdf = File.createTempFile(UUID.randomUUID().toString(), ".pdf");
		} catch (IOException e) {
			throw new RuntimeException(e);
		}

		try {
			JasperDesign jasperDesign = JRXmlLoader.load(inputStream);

			if (connection != null) {
				JRQuery jrQuery = jasperDesign.getQuery();
				if (jrQuery != null && Functions.isExists(jrQuery.getText())) {
					String jrQueryText = jrQuery.getText();
					jrQueryText = jrQueryText.concat(" limit $P{DATA_LIMIT}");

					JRDesignQuery newQuery = new JRDesignQuery();
					newQuery.setText(jrQueryText);

					jasperDesign.setQuery(newQuery);
				}
			}

			// TODO Definição temporario do limite de dados...
			parameters.put("DATA_LIMIT", ReportConstants.DATA_LIMIT);

			net.sf.jasperreports.engine.JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
			JasperPrint jasperPrint;
			if (connection == null) {
				jasperPrint = JasperFillManager.fillReport(jasperReport, parameters);
			} else {
				jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, connection);
				try {
					connection.close();
				} catch (SQLException ex) {
					// NoCommand
				}
			}

			JasperExportManager.exportReportToPdfFile(jasperPrint, pdf.getAbsolutePath());
		} catch (JRException e) {
			throw new RuntimeException(e);
		}

		java.nio.file.Path path = Paths.get(pdf.getAbsolutePath());

		byte[] data;
		try {
			data = Files.readAllBytes(path);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}

		if (pdf.exists())
			pdf.deleteOnExit();

		return Base64.getEncoder().encodeToString(data);
	}
}
