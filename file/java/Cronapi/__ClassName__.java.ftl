<#if PackageName?has_content && (PackageName?length > 0) >
package ${PackageName};
</#if>	

import cronapi.CronapiMetaData;
import cronapi.Utils;
import cronapi.Var;
import cronapi.CronapiMetaData.CategoryType;
import cronapi.CronapiMetaData.ObjectType;	
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

	@CronapiMetaData(type = "function", name = "${FunctionName}", description = "${Description}", returnType = ObjectType.STRING)
	public static Var ${ReducedFunctionName}(@ParamMetaData(type = ObjectType.STRING, description = "${InputDescription}") Var input) {
		return Var.valueOf("Input " + input.toString());
	}

}


