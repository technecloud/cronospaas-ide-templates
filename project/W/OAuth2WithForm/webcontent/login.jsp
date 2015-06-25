<!DOCTYPE html>
<html ng-app="app">
<head>
<meta charset="utf-8" />
<title>AngularJS User Registration and Login</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />
</head>
<body>

	<center>
		<form method="post" action="oauth2/auth">

			<fieldset style="width: 200px">
				<legend>OAuth2</legend>
				<input type="text" name="username" placeholder="User" /> 
				<br /> 
				<input
					type="password" name="password" placeholder="Password" /> <br />
				<hr />

				<input type="submit" value="Login" /> <a href="register.jsp">Register</a>
			</fieldset>
		</form>
	</center>


</body>
</html>