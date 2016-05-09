package reports.util;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

import net.sf.dynamicreports.adhoc.configuration.AdhocColumn;
import net.sf.dynamicreports.adhoc.report.DefaultAdhocReportCustomizer;
import net.sf.dynamicreports.report.builder.DynamicReports;
import net.sf.dynamicreports.report.builder.ReportBuilder;
import net.sf.dynamicreports.report.builder.component.ComponentBuilder;
import net.sf.dynamicreports.report.definition.datatype.DRIDataType;
import net.sf.dynamicreports.report.exception.DRException;
import util.GsonSingleton;

/**
 * Implementação local da classe {@linkplain DefaultAdhocReportCustomizer} contendo detalhes da execução do relatório
 * com base nas definições obtidas no editor Ad-hoc.
 */
class CronosAdhocReportCustomize extends DefaultAdhocReportCustomizer {

    @Override
    public void customize(ReportBuilder<?> report, net.sf.dynamicreports.adhoc.configuration.AdhocReport adhocReport)
            throws DRException {

        super.customize(report, adhocReport);

        String jsonProperty = adhocReport.getProperty(ReportConstants.ADHOC_REPORT_PROPETIES);
        AdhocReportProperty adhocReportProperty = GsonSingleton.INSTANCE.get().fromJson(jsonProperty, AdhocReportProperty.class);

        // Título
        ComponentBuilder<?, ?> title = components.get(ReportConstants.TITLE);
        if (title != null)
            report.title(title);

        // Paginação
        if (adhocReportProperty.isPagination())
            report.pageFooter(DynamicReports.cmp.pageXofY());

        // Linhas do relatório zebrada
        if (adhocReportProperty.isHighlightLines())
            report.highlightDetailOddRows();
    }

    @Override
    protected DRIDataType<?, ?> getFieldType(String name) {
        AdhocColumn column = adhocReport.getColumn(name);
        if (column == null)
            return super.getFieldType(name);
        String columnTypeName = column.getProperty(ReportConstants.COLUMN_TYPE);
        if (columnTypeName == null)
            return super.getFieldType(name);
        if (String.class.getSimpleName().equals(columnTypeName)) {
            return DynamicReports.type.stringType();
        } else if (Boolean.class.getSimpleName().equals(columnTypeName)) {
            return DynamicReports.type.booleanType();
        } else if (Byte.class.getSimpleName().equals(columnTypeName)) {
            return DynamicReports.type.byteType();
        } else if (Short.class.getSimpleName().equals(columnTypeName)) {
            return DynamicReports.type.shortType();
        } else if (Integer.class.getSimpleName().equals(columnTypeName)) {
            return DynamicReports.type.integerType();
        } else if (Long.class.getSimpleName().equals(columnTypeName)) {
            return DynamicReports.type.longType();
        } else if (Float.class.getSimpleName().equals(columnTypeName)) {
            return DynamicReports.type.floatType();
        } else if (Double.class.getSimpleName().equals(columnTypeName)) {
            return DynamicReports.type.doubleType();
        } else if (Date.class.getSimpleName().equals(columnTypeName) 
            || Time.class.getSimpleName().equals(columnTypeName) 
            || Timestamp.class.getSimpleName().equals(columnTypeName)) {
            return DynamicReports.type.dateType();
        } else {
            return super.getFieldType(name);
        }
    }

}
