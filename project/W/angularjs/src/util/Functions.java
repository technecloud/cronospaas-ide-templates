package util;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.util.Base64;
import java.util.Date;

/**
 * Funções genéricas para o projeto.
 */
public final class Functions {

	/**
	 * Realiza a decodificação de uma String Base64 para um determinado objeto.
	 *
	 * @param s String a ser decodificada.
	 * @return Objeto resultado da transformação
	 * @throws IOException
	 * @throws ClassNotFoundException
	 */
	public static Object fromString(String s) throws IOException, ClassNotFoundException {
		byte[] data = Base64.getDecoder().decode(s);
		ObjectInputStream ois = new ObjectInputStream(new ByteArrayInputStream(data));
		Object o = ois.readObject();
		ois.close();
		return o;
	}

	/**
	 * Verifica se um determinado valor existe, impede um saudoso 'NullPointerException'
	 *
	 * @param value
	 * @return true or false
	 */
	public static boolean isExists(String value) {
		return (value != null && !value.isEmpty());
	}

	/**
	 * Obtem um valor padrão dependendo do tipo requerido.
	 *
	 * @param type         Tipo do dado desejado.
	 * @param valueDefault Valor padrão a ser devolvido.
	 * @return Caso o valor padrão não seja nulo, será devolvido o mesmo valueDefault informado em parametro, senão
	 * será devolvido um valor padrão de acordo com o tipo informado.
	 */
	public static Object getDefaultValueBy(Class<?> type, Object valueDefault) {
		String sClass = type.getSimpleName();
		switch (sClass) {
		case "Boolean":
			if (valueDefault == null)
				valueDefault = false;
			return valueDefault;

		case "Short":
		case "Integer":
		case "Long":
			if (valueDefault == null)
				valueDefault = 0;
			if (valueDefault.getClass().isAssignableFrom(Double.class))
				return (int) Math.round((Double) valueDefault);
			return valueDefault;

		case "Float":
		case "Double":
			if (valueDefault == null)
				valueDefault = 0D;
			return valueDefault;

		case "Date":
		case "Time":
		case "Timestamp":
			if (valueDefault == null)
				valueDefault = new Date();
			return valueDefault;

		default:
			if (valueDefault == null)
				valueDefault = "";
			return "\"" + valueDefault + "\"";
		}
	}

}
