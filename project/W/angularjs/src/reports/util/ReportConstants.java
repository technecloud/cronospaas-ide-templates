package reports.util;

/**
 * Constantes comuns ao processo de impressão de relatórios criado com o módulo Adhoc.
 */
final class ReportConstants {

	/**
	 * Título do relatório.
	 */
	static final String TITLE = "TITLE";

	/**
	 * Guarda o tipo de dado da coluna.
	 */
	static final String COLUMN_TYPE = "COLUMN_TYPE";

	/**
	 * Chave para serializar objeto {@link AdhocReportProperty}
	 */
	static final String ADHOC_REPORT_PROPETIES = "ADHOC_REPORT_PROPETIES";

	/**
	 * Limite de dados.
	 * Essa implementação é temporária até a tela de definição dinâmica de parametros ficar pronta.
	 */
	static final int DATA_LIMIT = 1000;

}
