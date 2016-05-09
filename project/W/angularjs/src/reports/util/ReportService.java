package reports.util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * Serviço responsável pela impressão de impressos e relatórios criados no projeto.
 */
public final class ReportService {

	private final String reportName;
	private final PrintReport printReport;
	private final ClassLoader classLoader;

	private String datasource;
	private Map<String, Object> parameters;

	private ReportService(String reportName, PrintReport printReport) {
		this.reportName = reportName;
		this.printReport = printReport;
		this.classLoader = Thread.currentThread().getContextClassLoader();
	}

	public static ReportService printJasperReport(String reportName) {
		return new ReportService(reportName, new JasperPrintReport());
	}

	public static ReportService printAdhocReport(String reportName) {
		return new ReportService(reportName, new AdhocPrintReport());
	}

	public String getDatasource() {
		return datasource;
	}

	public ReportService setDatasource(String datasource) {
		this.datasource = datasource;
		return this;
	}

	public Map<String, Object> getParameters() {
		if (parameters == null)
			parameters = new HashMap<>(1);
		return parameters;
	}

	public ReportService setParameters(Map<String, Object> parameters) {
		this.parameters = parameters;
		return this;
	}

	public String getPDF() {
		Connection connection = this.getConnection();

		InputStream inputStream = classLoader.getResourceAsStream(this.reportName);
		if (inputStream == null)
			throw new RuntimeException(new Exception("Report not found!"));

		String reportResult = printReport.getPDF(inputStream, connection, parameters);
		try {
			if (connection != null)
				connection.close();
		} catch (SQLException e) {
			// NoCommand
		}
		return reportResult;
	}

	private Connection getConnection() {
		javax.naming.Context context = null;
		DataSource dataSource = null;
		try {
			context = (javax.naming.Context) new InitialContext().lookup("java:/comp/env");
			dataSource = (DataSource) context.lookup(this.datasource);
		} catch (NamingException e) {
			try {
				if (context != null)
					dataSource = (DataSource) context.lookup(this.datasource.toLowerCase());
			} catch (NamingException e1) {
				throw new RuntimeException(new Exception("Connection context not found.\nError: " + e.getMessage()));
			}
		}
		try {
			if (dataSource != null)
				return dataSource.getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(
					new Exception("Trouble getting a connection from the context.\nError: " + e.getMessage()));
		}
		return null;
	}

}
