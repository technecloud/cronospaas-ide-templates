package cronapi;

import cronapi.CronapiMetaData;
import cronapi.ParamMetaData;


/**
 * ${Description} ...
 *
 * @author ${UserName}
 * @version 1.0
 * @since ${.now?string("yyyy-MM-dd")}
 *
 */

@CronapiMetaData(categoryName = "${CategoryName}")
public class ${ClassName} {

	@CronapiMetaData(type = "function", name = "${FunctionName}", description = "${Description}")
	public static String ${ReducedFunctionName}(@ParamMetaData(description = "${InputDescription}") String input) throws Exception {
		return "Input " + input;
	}

}