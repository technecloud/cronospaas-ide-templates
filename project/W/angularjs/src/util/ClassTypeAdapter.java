package util;

import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;

import java.io.IOException;

/**
 * Adaptador do Gson para serializar o tipo classType do Java.
 */
public class ClassTypeAdapter extends TypeAdapter<Class<?>> {

	@Override
	public void write(JsonWriter jsonWriter, Class<?> aClass) throws IOException {
		if (aClass == null) {
			jsonWriter.nullValue();
			return;
		}
		jsonWriter.value(aClass.getName());
	}

	@Override
	public Class<?> read(JsonReader jsonReader) throws IOException {
		if (jsonReader.peek() == JsonToken.NULL) {
			jsonReader.nextNull();
			return null;
		}
		Class<?> clazz;
		try {
			clazz = Class.forName(jsonReader.nextString());
		} catch (ClassNotFoundException exception) {
			throw new IOException(exception);
		}
		return clazz;
	}
}
