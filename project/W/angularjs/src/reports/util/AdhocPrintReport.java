package reports.util;

import api.events.rest.exceptions.CustomWebApplicationException;
import br.com.techne.cronos.ide.util.SelectBuilder;
import net.sf.dynamicreports.adhoc.AdhocManager;
import net.sf.dynamicreports.adhoc.configuration.AdhocConfiguration;
import net.sf.dynamicreports.adhoc.configuration.AdhocReport;
import net.sf.dynamicreports.jasper.builder.JasperReportBuilder;
import net.sf.dynamicreports.report.exception.DRException;
import util.Functions;

import java.io.*;
import java.nio.file.Paths;
import java.sql.Connection;
import java.util.Base64;
import java.util.Map;
import java.util.UUID;

public class AdhocPrintReport implements PrintReport {

    private static final int LIMIT = 10;

    @Override
    public String getPDF(InputStream inputStream, Connection connection, Map<String, Object> parameters) {
        File pdf;
        try {
            pdf = File.createTempFile(UUID.randomUUID().toString(), ".pdf");
        } catch (IOException e) {
            throw new CustomWebApplicationException(new Exception(e));
        }

        FileOutputStream outputStream;
        try {
            outputStream = new FileOutputStream(pdf);
        } catch (FileNotFoundException e) {
            throw new CustomWebApplicationException(new Exception(e));
        }

        if (connection != null) {
            AdhocReport adhocReport;
            try {
                AdhocConfiguration configuration = AdhocManager.loadConfiguration(inputStream);
                adhocReport = configuration.getReport();
            } catch (DRException e) {
                throw new CustomWebApplicationException(new Exception(e));
            }

            SelectBuilder selectBuilder = new SelectBuilder();
            String propertyQuery = adhocReport.getProperty(AdhocConstants.QUERY);
            if (propertyQuery != null) {
                try {
                    selectBuilder = (SelectBuilder) Functions.fromString(propertyQuery);
                } catch (IOException | ClassNotFoundException e) {
                    throw new CustomWebApplicationException(new Exception(e));
                }
            }

            String query = selectBuilder.toString();

            // Parametro Limite, para evitar a impressão de todos os registros de uma tabela sem a supervisão do usuário.
            parameters.put("DATA_LIMIT", LIMIT);

            query = query.concat(" limit $P{DATA_LIMIT}");

            if (!query.isEmpty() && !"select *".equalsIgnoreCase(query)) {
                try {
                    JasperReportBuilder jasperReportBuilder = net.sf.dynamicreports.adhoc.AdhocManager.createReport(adhocReport, new CronosAdhocReportCustomize());
                    jasperReportBuilder.addParameter("DATA_LIMIT", LIMIT);
                    jasperReportBuilder.setParameters(parameters);
                    jasperReportBuilder.setDataSource(query, connection);
                    jasperReportBuilder.toPdf(outputStream);
                } catch (DRException e) {
                    throw new CustomWebApplicationException(new Exception(e));
                }
            }
        }

        java.nio.file.Path path = Paths.get(pdf.getAbsolutePath());

        byte[] data;
        try {
            data = java.nio.file.Files.readAllBytes(path);
        } catch (IOException e) {
            throw new CustomWebApplicationException(new Exception(e));
        }

        return Base64.getEncoder().encodeToString(data);
    }
}
