package util;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Classe responsavel por servir de container para o objeto {@link Gson}.
 * A instanciação da classe {@link Gson} é bem custosa e demorada, a ideia dessa implementação singleto é agilizar o
 * processo de utilização da classe Gson para serializar objetos Json.
 */
public enum GsonSingleton implements Bean<Gson> {

	INSTANCE {

		private Gson gson;

		/**
		 * Caso deseja-se gerar o json formatado, chamar o método {@link GsonBuilder#setPrettyPrinting()}
		 */
		@Override
		public Gson get() {
			if (this.gson == null) {
				this.gson = new GsonBuilder()
				  .registerTypeAdapterFactory(new ClassTypeAdapterFactory())
				  .registerTypeAdapter(Class.class, new ClassTypeAdapter())
				  .create();
			}
			return this.gson;
		}

		@Override
		public void set(Gson object) {
			this.gson = object;
		}
	}
}
