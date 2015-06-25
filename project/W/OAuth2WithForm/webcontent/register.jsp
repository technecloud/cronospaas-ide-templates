<!DOCTYPE html>
<html ng-app="app">
<head>
<meta charset="utf-8" />
<title>Register</title>
</head>
<body>

	<center>
	<form method="post" action="oauth2/register">
	
	<fieldset style="width: 200px">
    <legend>Register</legend>
		<input type="text" name="username" placeholder="User" /> 
		<br />
		<input type="text" name="email" placeholder="Email" /> 
		<br />
		<input
			type="password" name="password" placeholder="Password" /> 
		<br />
		<input
			type="password" name="password" placeholder="Confirm Password" /> 
		<br />
		<hr />
			
			<input
			type="submit" value="Register"/>
			<a href="login.jsp">Cancel</a>
	</fieldset>
	</form>
	</center>


</body>
</html>