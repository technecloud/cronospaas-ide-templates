package reports.util;

import java.io.InputStream;
import java.sql.Connection;
import java.util.Map;

public interface PrintReport {

    String getPDF(InputStream inputStream, Connection connection, Map<String, Object> parameters);
}
