package blockly;

import cronapi.*;
import cronapi.rest.security.CronappSecurity;
import java.util.concurrent.Callable;



@CronapiMetaData(type = "blockly")
@CronappSecurity
public class UserManager {

public static final int TIMEOUT = 300;

/**
 *
 * @param param_Entidade
 * @return Var
 */
// UserManager
public static Var BeforeInsert(Var param_Entidade) throws Exception {
 return new Callable<Var>() {

   // param
   private Var Entidade = param_Entidade;
   // end

   public Var call() throws Exception {

    Entidade =
    Var.valueOf(Normalize(Entidade));
    return Entidade;
   }
 }.call();
}

/**
 *
 * @param param_Entidade
 * @return Var
 */
// UserManager
public static Var BeforeUpdate(Var param_Entidade) throws Exception {
 return new Callable<Var>() {

   // param
   private Var Entidade = param_Entidade;
   // end

   public Var call() throws Exception {

    Entidade =
    Var.valueOf(Normalize(Entidade));
    return Entidade;
   }
 }.call();
}

/**
 *
 * @param Entidade
 * @return Var
 */
// Descreva esta função...
public static Var Normalize(Var Entidade) throws Exception {
 return new Callable<Var>() {

   private Var userName = Var.VAR_NULL;
   private Var email = Var.VAR_NULL;

   public Var call() throws Exception {

    userName =
    cronapi.text.Operations.normalize(
    cronapi.object.Operations.getObjectField(Entidade, Var.valueOf("userName")));

    email =
    cronapi.text.Operations.normalize(
    cronapi.object.Operations.getObjectField(Entidade, Var.valueOf("email")));

    cronapi.object.Operations.setObjectField(Entidade, Var.valueOf("normalizedUserName"), userName);

    cronapi.object.Operations.setObjectField(Entidade, Var.valueOf("normalizedEmail"), email);
    return Entidade;
   }
 }.call();
}

/**
 *
 * @param toAddress
 * @param toName
 * @param token
 * @return Var
 */
// Descreva esta função...
public static Var sendResetPasswordEmail(Var toAddress, Var toName, Var token) throws Exception {
 return new Callable<Var>() {

   private Var message = Var.VAR_NULL;
   private Var dataModel = Var.VAR_NULL;

   public Var call() throws Exception {

    message =
    cronapp.framework.mailer.MailerApi.createMessage();

    cronapp.framework.mailer.MailerApi.setFrom(message,
    Var.valueOf("email@gmail.com"),
    Var.valueOf("Nome do Remetente"));

    cronapp.framework.mailer.MailerApi.addTo(message, toAddress, toName);

    cronapp.framework.mailer.MailerApi.setSubject(message,
    cronapi.i18n.Operations.translate(Var.valueOf("ResetPasswordEmailSubject")));

    dataModel =
    cronapi.map.Operations.createObjectMap();

    cronapi.map.Operations.setMapFieldByKey(dataModel,
    Var.valueOf("link"),
    Var.valueOf(
    cronapi.screen.Operations.getHeader(
    Var.valueOf("Origin")).toString() +
    Var.valueOf("/#/public/reset-password?token=").toString() +
    token.toString()));

    cronapi.map.Operations.setMapFieldByKey(dataModel,
    Var.valueOf("email"), toAddress);

    cronapp.framework.mailer.MailerApi.setText(message, Var.VAR_NULL,
    cronapp.framework.templater.TemplaterApi.process(
    Var.valueOf("reset-password.ftlh"), dataModel));

    cronapp.framework.mailer.MailerApi.addInlineAttachment(
    Var.valueOf("headerImageCid"), message,
    Var.valueOf("https://acesso.cronapp.io/img/header.png"));

    cronapp.framework.mailer.MailerApi.addInlineAttachment(
    Var.valueOf("footerImageCid"), message,
    Var.valueOf("https://acesso.cronapp.io/img/footer.png"));

    cronapp.framework.mailer.MailerApi.send(message);
    return Var.VAR_NULL;
   }
 }.call();
}

}

