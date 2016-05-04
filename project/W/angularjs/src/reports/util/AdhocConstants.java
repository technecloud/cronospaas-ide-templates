package reports.util;

import br.com.techne.cronos.ide.util.SelectBuilder;

/**
 * Constantes comuns ao processo de impressão de relatórios criado com o módulo Adhoc.
 * <p>
 * Created by arthemus on 04/05/16.
 */
public final class AdhocConstants {

    /**
     * Título do relatório.
     */
    static final String TITLE = "TITLE";

    /**
     * Define se o relatório apresenta ou não o número da paginaa atual pelo total de paginas no rodapé.
     */
    static final String PAGINATION = "PAGINATION";

    /**
     * Para identificar a propriedade onde é salva a serialização do objeto {@link SelectBuilder}.
     */
    static final String QUERY = "QUERY";

    /**
     * Datasource utilizado 'internamente' para compilação e exibição do preview.
     */
    static final String DATASOURCE = "DATASOURCE";

    /**
     * Guarda a definição de linhas zebradas no relatório.
     */
    static final String HIGHLIGHT_ROWS = "HIGHLIGHT_ROWS";

    /**
     * Guarda o tipo de dado da coluna.
     */
    static final String COLUMN_TYPE = "COLUMN_TYPE";

}
