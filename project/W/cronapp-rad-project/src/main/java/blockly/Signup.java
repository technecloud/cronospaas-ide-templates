package blockly;

import cronapi.*;
import cronapi.rest.security.CronappSecurity;
import java.util.concurrent.Callable;



@CronapiMetaData(type = "blockly")
@CronappSecurity(post = "Public", get = "Public", execute = "Public", delete = "Public", put = "Public")
public class Signup {

public static final int TIMEOUT = 300;

/**
 *
 * @param @ParamMetaData
 * @return Var
 */
// Descreva esta função...
public static Var signupApp(@ParamMetaData(description = "username") Var username, @ParamMetaData(description = "email") Var email, @ParamMetaData(description = "password") Var password) throws Exception {
 return new Callable<Var>() {

   private Var uri = Var.VAR_NULL;
   private Var retorno = Var.VAR_NULL;
   private Var error = Var.VAR_NULL;
   private Var msgReturn = Var.VAR_NULL;

   public Var call() throws Exception {

    try {

        uri =
        Var.valueOf(
        cronapi.screen.Operations.getHeader(
        Var.valueOf("Origin")).toString() +
        Var.valueOf("/auth/signup").toString());

        retorno =
        cronapi.util.Operations.getURLFromOthers(
        Var.valueOf("POST"),
        Var.valueOf("application/json"), uri, Var.VAR_NULL, Var.VAR_NULL,
        cronapi.map.Operations.createObjectMapWith(Var.valueOf("username",username) , Var.valueOf("email",email) , Var.valueOf("password",password)));

        retorno =
        cronapi.json.Operations.toJson(retorno);
     } catch (Exception error_exception) {
          error = Var.valueOf(error_exception);

        cronapi.util.Operations.log(
        Var.valueOf("General"),
        Var.valueOf("SEVERE"),
        cronapi.json.Operations.getJsonOrMapField(error,
        Var.valueOf("message")), Var.VAR_NULL);
     } finally {

        msgReturn =
        cronapi.json.Operations.getJsonOrMapField(retorno,
        Var.valueOf("message"));

        if (
        Var.valueOf(
        cronapi.json.Operations.getJsonOrMapField(retorno,
        Var.valueOf("code")).equals(
        Var.valueOf("200"))).getObjectAsBoolean()) {

            cronapi.util.Operations.callClientFunction( Var.valueOf("cronapi.screen.notify"), Var.valueOf("success"), msgReturn);
        } else {

            cronapi.util.Operations.callClientFunction( Var.valueOf("cronapi.screen.notify"), Var.valueOf("error"),
            /*# sourceMappingStart=Dt?q$#Z@w,Il7m-~K5pN */
            cronapi.logic.Operations.isEmpty(msgReturn).getObjectAsBoolean() ?
            cronapi.i18n.Operations.translate(Var.valueOf("SignupAppBlockly")) : msgReturn);
        }
    }
    return retorno;
   }
 }.call();
}

}

