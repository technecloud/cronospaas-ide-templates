<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>

<%
  response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
  String contextPath      = request.getContextPath();
  String helpMessage      = "";

  // conferir se houve erro na última tentativa de login
  String error = request.getParameter("error") + "";
  if("true".equals(error)){
	helpMessage = "Invalid user or password!";
  }
%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv='X-UA-Compatible' content='IE=edge' />

  <title>Login</title>

  <!-- estilos da página de login foram centralizados -->
  <link href='<%= contextPath %>/login.css' type='text/css' rel='stylesheet'>


<script type='text/javascript'>
  function initialFocus(form){
  	with(form.elements['j_username']){
  		select();
  		focus();
  	}
  };

  function doClickingButton(name, text){
    var button = document.getElementById(name);
    button.setAttribute('value', text);
    button.className += ' pulse';
  };

  function doSubmitActions(form){

    // Remove mensagem de ajuda na próxima tentativa de login.
    var helpMsg = document.getElementById('helpmsg');
    if(helpMsg){
      helpMsg.remove();
    }

    // Alterando texto do botão
    doClickingButton('j_enter', 'Autenticando...');

    // Desabilitando objetos clicáveis e/ou alteráveis
    document.getElementById('j_enter').setAttribute('disabled', true);
    document.getElementById('j_user').setAttribute('readonly', true);
    document.getElementById('j_password').setAttribute('readonly', true);

    if(document.getElementById('forgotPasswd')){
      document.getElementById('forgotPasswd').setAttribute('className','disabled');
    }

    // Submetendo formulário
    form.submit();
  };
</script>
</head>

<body onLoad="initialFocus(document.forms[0])">


  <!-- FORM LOGIN -->
  <div class="container">
  <div class="login">
      <h1>
       <img src="/logo.gif"/>
      </h1>
      <form id='loginForm' action='<%= contextPath %>/j_security_check' method='post'>
        <p><input type="text"     name="j_username" id='j_user'     placeholder="Usu&aacute;rio"></p>
        <p><input type="password" name="j_password" id='j_password' placeholder="Senha"></p>
        <p class="esqueceu_senha">
        </p>
        <p class="submit">
          <input type="submit" name='j_enter' id='j_enter' value="Entrar" title="Clique para autenticar" onClick='doSubmitActions(document.forms[0]);'>
        </p>

        <%if (helpMessage != null && helpMessage.trim().length() > 0) {%>
        <div id="helpmsg" class="helpmsg"><br/><hr/><%= helpMessage %></div>
        <%} %>
      </form>
  </div>
  </div>
  <!-- FORM LOGIN -->

</body>
</html>
