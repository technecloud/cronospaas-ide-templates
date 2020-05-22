<#if PackageName?has_content && (PackageName?length > 0) >
package ${PackageName};
</#if>	

import cronapi.CronapiMetaData;
import cronapi.Utils;
import cronapi.Var;
import cronapi.CronapiMetaData.CategoryType;
import cronapi.CronapiMetaData.ObjectType;	
import cronapi.ParamMetaData;
import cronapi.rest.security.CronappSecurity;


/**
 * @author ${UserName}
 * @version 1.0
 * @since ${.now?string("yyyy-MM-dd")}
 *
 */
 
@CronapiMetaData(type = "blockly") 
@CronappSecurity
public class ${ClassName} {

	@CronapiMetaData(type = "blockly")
	public static Var ${FunctionName}(Var input) throws Exception {
		return Var.valueOf("Input " + input.toString());
	}

}


