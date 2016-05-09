package reports.util;

import java.io.InputStream;
import java.sql.Connection;
import java.util.Map;

/**
 * Interface comum aos processos de impressão de relatórios.
 */
interface PrintReport {

	/**
	 * Obtem uma String Base64 com o impresso já processado.
	 *
	 * @param inputStream Inputstream do arquivo do relatório.
	 * @param connection  Conexão com o banco de dados.
	 * @param parameters  Parametros internos do relatório.
	 * @return String com o impresso já processado.
	 */
	String getPDF(InputStream inputStream, Connection connection, Map<String, Object> parameters);
}
