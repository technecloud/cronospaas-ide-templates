<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="oauth2.flow.password.*"%>
<%
Object token = OAuth2Servlet.getSessionAttribute(request, OAuth2Servlet.SessionAttributes.TOKEN);
if(token == null){
	out.println("<a href='login.jsp'>Login</a>");
}else{
	Object userName = OAuth2Servlet.getSessionAttribute(request, OAuth2Servlet.SessionAttributes.USERNAME);
	Object roleNames = OAuth2Servlet.getSessionAttribute(request, OAuth2Servlet.SessionAttributes.ROLE_NAMES);
	out.println("UserName: " + userName);
	out.println("RoleNames: " + roleNames);
	out.println("<br><a href='oauth2/logout'>Logoff</a>");
}
%>