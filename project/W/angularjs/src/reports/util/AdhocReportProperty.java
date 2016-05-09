package reports.util;

import java.io.Serializable;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import net.sf.dynamicreports.adhoc.configuration.AdhocCalculation;
import net.sf.dynamicreports.adhoc.configuration.AdhocColumn;
import net.sf.dynamicreports.adhoc.configuration.AdhocGroup;
import net.sf.dynamicreports.adhoc.configuration.AdhocReport;
import net.sf.dynamicreports.adhoc.configuration.AdhocSort;
import net.sf.dynamicreports.adhoc.configuration.AdhocSubtotal;
import net.sf.dynamicreports.adhoc.configuration.AdhocSubtotalPosition;
import net.sf.dynamicreports.adhoc.configuration.AdhocTextField;
import util.Functions;
import util.GsonSingleton;
import util.SelectBuilder;

/**
 * Classe auxiliar para definição das propriedades do relatório Adhoc, guardando informações de design e da query
 * utilizada na consulta ao banco de dados.
 */
class AdhocReportProperty implements Serializable {

	private static final long serialVersionUID = 1L;

	private AdhocTextField title;
	private boolean highlightLines;
	private boolean pagination;
	private List<String> tables;
	private List<AdhocColumn> columns;
	private List<String> sorts;
	private List<String> groups;
	private List<SummaryObject> summaryObjects;
	private List<WhereObject> whereObjects;
	private String datasource;
	private String sql;
	private Map<String, Object> reportParameters;

	public AdhocReportProperty() {
		this.title = ReportComponentsFactory.newDefaultTextField(ReportConstants.TITLE, "");
		this.highlightLines = Boolean.FALSE;
		this.pagination = Boolean.FALSE;
		this.tables = new LinkedList<>();
		this.columns = new LinkedList<>();
		this.sorts = new LinkedList<>();
		this.groups = new LinkedList<>();
		this.summaryObjects = new LinkedList<>();
		this.whereObjects = new LinkedList<>();
		this.datasource = "";
		this.sql = "";
		this.reportParameters = new HashMap<>(10);
	}

	AdhocReport newAdhocReport() {

		AdhocReport adhocReport = new AdhocReport();

		// Serialização dessa classe como um JSON para ser guardado como uma propriedade do relatório.
		String jsonProperty = GsonSingleton.INSTANCE.get().toJson(this);
		adhocReport.setProperty(ReportConstants.ADHOC_REPORT_PROPETIES, jsonProperty);

		// Título...
		adhocReport.setComponent(ReportConstants.TITLE, this.getTitle());

		// Colunas...
		this.getColumns().stream().forEach(adhocReport::addColumn);

		// Ordens...
		this.getSorts().stream().forEach(s -> {
			AdhocSort adhocSort = new AdhocSort();
			adhocSort.setName(s);
			adhocReport.addSort(adhocSort);
		});

		// Grupos...
		this.getGroups().stream().forEach(s -> {
			AdhocGroup adhocGroup = new AdhocGroup();
			adhocGroup.setName(s);
			adhocGroup.setStyle(ReportComponentsFactory.newDefaultGroupStyle());
			adhocReport.addGroup(adhocGroup);
		});

		// Sub-totais...
		this.getSummaryObjects().stream().forEach(summaryObject -> {
			AdhocSubtotal adhocSubtotal = new AdhocSubtotal();
			adhocSubtotal.setName(summaryObject.getColumn());
			adhocSubtotal.setStyle(ReportComponentsFactory.newDefaultSubtotalStyle());
			adhocSubtotal.setLabel(summaryObject.getLabel());
			adhocSubtotal.setLabelStyle(ReportComponentsFactory.newDefaultSubtotalLabelStyle());
			adhocSubtotal.setCalculation(AdhocCalculation.valueOf(summaryObject.getAdhocCalculation()));
			adhocSubtotal.setPosition(AdhocSubtotalPosition.valueOf(summaryObject.getAdhocSubtotalPosition()));
			adhocSubtotal.setGroupName(summaryObject.getGroup());
			adhocReport.addSubtotal(adhocSubtotal);
		});

		return adhocReport;
	}

	public AdhocTextField getTitle() {
		return title;
	}

	public void setTitle(AdhocTextField title) {
		this.title = title;
	}

	public boolean isHighlightLines() {
		return highlightLines;
	}

	public void setHighlightLines(boolean highlightLines) {
		this.highlightLines = highlightLines;
	}

	public boolean isPagination() {
		return pagination;
	}

	public void setPagination(boolean pagination) {
		this.pagination = pagination;
	}

	public List<String> getTables() {
		return tables;
	}

	public void setTables(List<String> tables) {
		this.tables = tables;
	}

	public List<AdhocColumn> getColumns() {
		return columns;
	}

	public void setColumns(List<AdhocColumn> columns) {
		this.columns = columns;
	}

	public List<String> getSorts() {
		return sorts;
	}

	public void setSorts(List<String> sorts) {
		this.sorts = sorts;
	}

	public List<String> getGroups() {
		return groups;
	}

	public void setGroups(List<String> groups) {
		this.groups = groups;
	}

	public List<SummaryObject> getSummaryObjects() {
		return summaryObjects;
	}

	public void setSummaryObjects(List<SummaryObject> summaryObjects) {
		this.summaryObjects = summaryObjects;
	}

	public List<WhereObject> getWhereObjects() {
		return whereObjects;
	}

	public void setWhereObjects(List<WhereObject> whereObjects) {
		this.whereObjects = whereObjects;
	}

	public String getDatasource() {
		return datasource;
	}

	public void setDatasource(String datasource) {
		this.datasource = datasource;
	}

	public String getSql() {
		this.doCompileSql();
		return this.sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

	public Map<String, Object> getReportParameters() {
		return reportParameters;
	}

	public void setReportParameters(Map<String, Object> reportParameters) {
		this.reportParameters = reportParameters;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;
		AdhocReportProperty that = (AdhocReportProperty) o;
		if (highlightLines != that.highlightLines)
			return false;
		if (pagination != that.pagination)
			return false;
		if (title != null ? !title.equals(that.title) : that.title != null)
			return false;
		if (tables != null ? !tables.equals(that.tables) : that.tables != null)
			return false;
		if (columns != null ? !columns.equals(that.columns) : that.columns != null)
			return false;
		if (sorts != null ? !sorts.equals(that.sorts) : that.sorts != null)
			return false;
		if (groups != null ? !groups.equals(that.groups) : that.groups != null)
			return false;
		if (summaryObjects != null ? !summaryObjects.equals(that.summaryObjects) : that.summaryObjects != null)
			return false;
		if (whereObjects != null ? !whereObjects.equals(that.whereObjects) : that.whereObjects != null)
			return false;
		if (datasource != null ? !datasource.equals(that.datasource) : that.datasource != null)
			return false;
		if (sql != null ? !sql.equals(that.sql) : that.sql != null)
			return false;
		return reportParameters != null ? reportParameters.equals(that.reportParameters) : that.reportParameters == null;
	}

	@Override
	public int hashCode() {
		int result = title != null ? title.hashCode() : 0;
		result = 31 * result + (highlightLines ? 1 : 0);
		result = 31 * result + (pagination ? 1 : 0);
		result = 31 * result + (tables != null ? tables.hashCode() : 0);
		result = 31 * result + (columns != null ? columns.hashCode() : 0);
		result = 31 * result + (sorts != null ? sorts.hashCode() : 0);
		result = 31 * result + (groups != null ? groups.hashCode() : 0);
		result = 31 * result + (summaryObjects != null ? summaryObjects.hashCode() : 0);
		result = 31 * result + (whereObjects != null ? whereObjects.hashCode() : 0);
		result = 31 * result + (datasource != null ? datasource.hashCode() : 0);
		result = 31 * result + (sql != null ? sql.hashCode() : 0);
		result = 31 * result + (reportParameters != null ? reportParameters.hashCode() : 0);
		return result;
	}

	@Override
	public String toString() {
		return "AdhocReportProperty{" + "title=" + title + ", highlightLines=" + highlightLines + ", pagination="
				+ pagination + ", tables=" + tables + ", columns=" + columns + ", sorts=" + sorts + ", groups=" + groups
				+ ", summaryObjects=" + summaryObjects + ", whereObjects=" + whereObjects + ", datasource='"
				+ datasource + '\'' + ", sql='" + sql + '\'' + ", reportParameters=" + reportParameters + '}';
	}

	private String getWhereCondition(WhereObject whereObject) {
		String field = whereObject.getField();
		String operator = whereObject.getOperator();
		String whereCondition = "";
		Object[] valuesArray = whereObject.getValues().toArray(new Object[0]);
		if (Arrays.asList("=", "<>", ">", ">=", "<", "<=", "LIKE").contains(whereObject.getOperator())) {
			if (valuesArray.length > 0) {
				Object valueBy = Functions.getDefaultValueBy(whereObject.getType(), valuesArray[0]);
				String value = String.valueOf(valueBy);
				whereCondition = field.concat(" " + operator + " ").concat(value);
			}
		} else if ("BETWEEN".equals(whereObject.getOperator())) {
			if (valuesArray.length > 1) {
				Object _1 = Functions.getDefaultValueBy(whereObject.getType(), valuesArray[0]);
				Object _2 = Functions.getDefaultValueBy(whereObject.getType(), valuesArray[1]);
				String value1 = String.valueOf(_1);
				String value2 = String.valueOf(_2);
				whereCondition = field.concat(" " + operator + " ").concat(value1).concat(" AND ").concat(value2);
			}
		}
		return whereCondition;
	}

	private void doCompileSql() {
		SelectBuilder selectBuilder = new SelectBuilder();
		this.getTables().stream().forEach(selectBuilder::addTable);
		this.getColumns().stream().forEach(adhocColumn -> selectBuilder.addColumn(adhocColumn.getName()));
		this.getWhereObjects().stream().forEach(whereObject -> selectBuilder.where(this.getWhereCondition(whereObject)));
		this.sql = selectBuilder.toString();
	}

}
