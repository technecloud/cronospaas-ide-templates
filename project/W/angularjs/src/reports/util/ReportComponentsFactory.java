package reports.util;

import net.sf.dynamicreports.adhoc.configuration.AdhocFont;
import net.sf.dynamicreports.adhoc.configuration.AdhocHorizontalAlignment;
import net.sf.dynamicreports.adhoc.configuration.AdhocPen;
import net.sf.dynamicreports.adhoc.configuration.AdhocStyle;
import net.sf.dynamicreports.adhoc.configuration.AdhocTextField;
import net.sf.dynamicreports.adhoc.configuration.AdhocVerticalAlignment;
import util.Geleia;

/**
 * Fabrica para construção de componentes de um relatório Ad-hoc.
 */
class ReportComponentsFactory {

	static AdhocTextField newDefaultTextField(String key, String text) {
		AdhocTextField adhocTextField = new AdhocTextField();
		adhocTextField.setKey(Geleia.stringRandomNotNull(key));
		adhocTextField.setText(Geleia.stringNotNull(text));
		adhocTextField.setStyle(newDefaultStyle());
		return adhocTextField;
	}

	private static AdhocStyle newDefaultStyle() {
		AdhocStyle adhocStyle = new AdhocStyle();
		adhocStyle.setFont(new AdhocFont());
		adhocStyle.getFont().setBold(Boolean.FALSE);
		adhocStyle.getFont().setItalic(Boolean.FALSE);
		adhocStyle.getFont().setFontSize(12);
		adhocStyle.getFont().setStrikeThrough(Boolean.FALSE);
		adhocStyle.getFont().setUnderline(Boolean.FALSE);
		adhocStyle.setForegroundColor(java.awt.Color.BLACK);
		adhocStyle.setBackgroundColor(java.awt.Color.WHITE);
		adhocStyle.setHorizontalAlignment(AdhocHorizontalAlignment.LEFT);
		adhocStyle.setVerticalAlignment(AdhocVerticalAlignment.TOP);
		return adhocStyle;
	}

	static AdhocStyle newDefaultGroupStyle() {
		AdhocStyle adhocStyle = new AdhocStyle();
		adhocStyle.setFont(new AdhocFont());
		adhocStyle.getFont().setBold(Boolean.TRUE);
		adhocStyle.getFont().setItalic(Boolean.FALSE);
		adhocStyle.getFont().setFontSize(14);
		adhocStyle.getFont().setStrikeThrough(Boolean.FALSE);
		adhocStyle.getFont().setUnderline(Boolean.FALSE);
		adhocStyle.setForegroundColor(java.awt.Color.BLACK);
		adhocStyle.setBackgroundColor(java.awt.Color.WHITE);
		adhocStyle.setHorizontalAlignment(AdhocHorizontalAlignment.LEFT);
		adhocStyle.setVerticalAlignment(AdhocVerticalAlignment.TOP);
		return adhocStyle;
	}

	static AdhocStyle newDefaultSubtotalStyle() {
		AdhocStyle adhocStyle = new AdhocStyle();
		adhocStyle.setFont(new AdhocFont());
		adhocStyle.getFont().setBold(Boolean.TRUE);
		adhocStyle.getFont().setItalic(Boolean.FALSE);
		adhocStyle.getFont().setFontSize(12);
		adhocStyle.getFont().setStrikeThrough(Boolean.FALSE);
		adhocStyle.getFont().setUnderline(Boolean.FALSE);
		adhocStyle.setForegroundColor(java.awt.Color.BLACK);
		adhocStyle.setBackgroundColor(java.awt.Color.WHITE);
		adhocStyle.setHorizontalAlignment(AdhocHorizontalAlignment.RIGHT);
		adhocStyle.setVerticalAlignment(AdhocVerticalAlignment.TOP);
		adhocStyle.setTopBorder(newDefaultAdhocLinePen());
		return adhocStyle;
	}

	private static AdhocPen newDefaultAdhocLinePen() {
		AdhocPen adhocPen = new AdhocPen();
		adhocPen.setLineWidth(1f);
		adhocPen.setLineColor(java.awt.Color.BLACK);
		return adhocPen;
	}

	static AdhocStyle newDefaultSubtotalLabelStyle() {
		AdhocStyle adhocStyle = new AdhocStyle();
		adhocStyle.setFont(new AdhocFont());
		adhocStyle.getFont().setBold(Boolean.FALSE);
		adhocStyle.getFont().setItalic(Boolean.TRUE);
		adhocStyle.getFont().setFontSize(8);
		adhocStyle.getFont().setStrikeThrough(Boolean.FALSE);
		adhocStyle.getFont().setUnderline(Boolean.FALSE);
		adhocStyle.setForegroundColor(java.awt.Color.GRAY);
		adhocStyle.setBackgroundColor(java.awt.Color.WHITE);
		adhocStyle.setHorizontalAlignment(AdhocHorizontalAlignment.LEFT);
		adhocStyle.setVerticalAlignment(AdhocVerticalAlignment.TOP);
		return adhocStyle;
	}

}
