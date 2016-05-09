package util;

import java.io.Serializable;

/**
 * Interface auxiliar para implementação de um JavaBean padrão.
 */
public interface Bean<T> extends Serializable {

	/**
	 * Obtem o valor do objeto.
	 *
	 * @return Valor.
	 */
	T get();

	/**
	 * Define o valor do objeto.
	 *
	 * @param object Valor a ser definido.
	 */
	void set(T object);
}
