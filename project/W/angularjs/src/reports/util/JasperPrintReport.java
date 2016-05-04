package reports.util;

import api.events.rest.exceptions.CustomWebApplicationException;
import net.sf.jasperreports.engine.*;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.util.Base64;
import java.util.Map;
import java.util.UUID;

public class JasperPrintReport implements PrintReport {

    @Override
    public String getPDF(InputStream inputStream, Connection connection, Map<String, Object> parameters) {
        File pdf;
        try {
            pdf = File.createTempFile(UUID.randomUUID().toString(), ".pdf");
        } catch (IOException e) {
            throw new CustomWebApplicationException(new Exception(e));
        }

        try {
            JasperReport jasperReport = JasperCompileManager.compileReport(inputStream);
            JasperPrint jasperPrint;
            if (connection == null) {
                jasperPrint = JasperFillManager.fillReport(jasperReport, parameters);
            } else {
                jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, connection);
            }
            JasperExportManager.exportReportToPdfFile(jasperPrint, pdf.getAbsolutePath());
        } catch (JRException e) {
            throw new CustomWebApplicationException(new Exception(e));
        }

        java.nio.file.Path path = Paths.get(pdf.getAbsolutePath());

        byte[] data;
        try {
            data = Files.readAllBytes(path);
        } catch (IOException e) {
            throw new CustomWebApplicationException(new Exception(e));
        }

        if (pdf.exists())
            pdf.deleteOnExit();

        return Base64.getEncoder().encodeToString(data);
    }
}
