package reports.util;

import java.io.Serializable;

/**
 * Classe de representação de um sub-total do relatório.
 */
public class SummaryObject implements Serializable {

	private static final long serialVersionUID = 1L;

	private String column;
	private String label;
	private String adhocCalculation;
	private String posicao;
	private String group;
	private String adhocSubtotalPosition;

	public String getColumn() {
		return column;
	}

	public void setColumn(String column) {
		this.column = column;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getAdhocCalculation() {
		return adhocCalculation;
	}

	public void setAdhocCalculation(String adhocCalculation) {
		this.adhocCalculation = adhocCalculation;
	}

	public String getPosicao() {
		return posicao;
	}

	public void setPosicao(String posicao) {
		this.posicao = posicao;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public String getAdhocSubtotalPosition() {
		return adhocSubtotalPosition;
	}

	public void setAdhocSubtotalPosition(String adhocSubtotalPosition) {
		this.adhocSubtotalPosition = adhocSubtotalPosition;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;
		SummaryObject that = (SummaryObject) o;
		if (column != null ? !column.equals(that.column) : that.column != null)
			return false;
		if (label != null ? !label.equals(that.label) : that.label != null)
			return false;
		if (adhocCalculation != null ? !adhocCalculation.equals(that.adhocCalculation) : that.adhocCalculation != null)
			return false;
		if (posicao != null ? !posicao.equals(that.posicao) : that.posicao != null)
			return false;
		if (group != null ? !group.equals(that.group) : that.group != null)
			return false;
		return adhocSubtotalPosition != null ? adhocSubtotalPosition.equals(that.adhocSubtotalPosition)
				: that.adhocSubtotalPosition == null;
	}

	@Override
	public int hashCode() {
		int result = column != null ? column.hashCode() : 0;
		result = 31 * result + (label != null ? label.hashCode() : 0);
		result = 31 * result + (adhocCalculation != null ? adhocCalculation.hashCode() : 0);
		result = 31 * result + (posicao != null ? posicao.hashCode() : 0);
		result = 31 * result + (group != null ? group.hashCode() : 0);
		result = 31 * result + (adhocSubtotalPosition != null ? adhocSubtotalPosition.hashCode() : 0);
		return result;
	}

	@Override
	public String toString() {
		return "SummaryObject{" + "column='" + column + '\'' + ", label='" + label + '\'' + ", adhocCalculation='"
				+ adhocCalculation + '\'' + ", posicao='" + posicao + '\'' + ", group='" + group + '\''
				+ ", adhocSubtotalPosition='" + adhocSubtotalPosition + '\'' + '}';
	}

}
