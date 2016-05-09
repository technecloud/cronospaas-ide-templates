package reports.util;

import java.io.Serializable;
import java.util.LinkedHashSet;

/**
 * Classe de representação de uma condição do relatório.
 */
public class WhereObject implements Serializable {

	private static final long serialVersionUID = 1L;

	private String field;
	private Class<?> type;
	private String operator;
	private LinkedHashSet<Object> values;

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public Class<?> getType() {
		return type;
	}

	public void setType(Class<?> type) {
		this.type = type;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public LinkedHashSet<Object> getValues() {
		return values;
	}

	public void setValues(LinkedHashSet<Object> values) {
		this.values = values;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;
		WhereObject that = (WhereObject) o;
		if (field != null ? !field.equals(that.field) : that.field != null)
			return false;
		if (type != null ? !type.equals(that.type) : that.type != null)
			return false;
		if (operator != null ? !operator.equals(that.operator) : that.operator != null)
			return false;
		return values != null ? values.equals(that.values) : that.values == null;
	}

	@Override
	public int hashCode() {
		int result = field != null ? field.hashCode() : 0;
		result = 31 * result + (type != null ? type.hashCode() : 0);
		result = 31 * result + (operator != null ? operator.hashCode() : 0);
		result = 31 * result + (values != null ? values.hashCode() : 0);
		return result;
	}

	@Override
	public String toString() {
		return "WhereObject{" + "field='" + field + '\'' + ", type=" + type + ", operator='" + operator + '\''
				+ ", values=" + values + '}';
	}

}
