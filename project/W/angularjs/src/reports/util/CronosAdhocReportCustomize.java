package reports.util;

import net.sf.dynamicreports.adhoc.configuration.AdhocColumn;
import net.sf.dynamicreports.adhoc.report.DefaultAdhocReportCustomizer;
import net.sf.dynamicreports.report.builder.ReportBuilder;
import net.sf.dynamicreports.report.builder.component.ComponentBuilder;
import net.sf.dynamicreports.report.definition.datatype.DRIDataType;
import net.sf.dynamicreports.report.exception.DRException;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

import static net.sf.dynamicreports.report.builder.DynamicReports.cmp;
import static net.sf.dynamicreports.report.builder.DynamicReports.type;

/**
 * Implementação local da classe {@linkplain DefaultAdhocReportCustomizer} contendo detalhes da execução do relatório 
 * com base nas definições obtidas no editor Ad-hoc.
 * 
 * Created by arthemus on 08/04/16.
 */
class CronosAdhocReportCustomize extends DefaultAdhocReportCustomizer {
  
  @Override
  public void customize(ReportBuilder<?> report, net.sf.dynamicreports.adhoc.configuration.AdhocReport adhocReport)
          throws DRException {
          
    super.customize(report, adhocReport);
    
    // Título
    ComponentBuilder<?, ?> title = components.get(AdhocConstants.TITLE);
    if(title != null)
      report.title(title);
      
    // Paginação
    Boolean paginacao = adhocReport.getProperty(AdhocConstants.PAGINATION);
    if(paginacao != null && paginacao)
      report.pageFooter(cmp.pageXofY());
      
    // Linhas do relatório zebrada
    Boolean linhasZebradas = adhocReport.getProperty(AdhocConstants.HIGHLIGHT_ROWS);
    if(linhasZebradas != null && linhasZebradas)
      report.highlightDetailOddRows();
  }
  
  @Override
  protected DRIDataType<?, ?> getFieldType(String name) {
    AdhocColumn column = adhocReport.getColumn(name);
    if(column == null)
      return super.getFieldType(name);
    String columnTypeName = column.getProperty(AdhocConstants.COLUMN_TYPE);
    if(columnTypeName == null)
      return super.getFieldType(name);
    if(String.class.getSimpleName().equals(columnTypeName)) {
      return type.stringType();
    }
    else if(Boolean.class.getSimpleName().equals(columnTypeName)) {
      return type.booleanType();
    }
    else if(Byte.class.getSimpleName().equals(columnTypeName)) {
      return type.byteType();
    }
    else if(Short.class.getSimpleName().equals(columnTypeName)) {
      return type.shortType();
    }
    else if(Integer.class.getSimpleName().equals(columnTypeName)) {
      return type.integerType();
    }
    else if(Long.class.getSimpleName().equals(columnTypeName)) {
      return type.longType();
    }
    else if(Float.class.getSimpleName().equals(columnTypeName)) {
      return type.floatType();
    }
    else if(Double.class.getSimpleName().equals(columnTypeName)) {
      return type.doubleType();
    }
    else if(Date.class.getSimpleName().equals(columnTypeName)
            || Time.class.getSimpleName().equals(columnTypeName)
            || Timestamp.class.getSimpleName().equals(columnTypeName)) {
      return type.dateType();
    }
    else {
      return super.getFieldType(name);
    }
  }

}
