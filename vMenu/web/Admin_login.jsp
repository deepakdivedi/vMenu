<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Login_page.css">
</head>
<div class="login-page">
	<div class="form">
		<form class="login-form"
			action="http://localhost:8080/PROJECT/validate_admin" method="post">
			<table>
				<tr>
					<td align="left"><font color="Whitesmoke">ID:</font></td>
					<td><input type="text" placeholder="username" name="username" /></td>
				</tr>
				<tr>
					<td align="left"><font color="Whitesmoke">Password:</font></td>
					<td><input type="password" placeholder="password"
						name="password" /></td>
				</tr>
			</table>
			<button class="button"
				formaction="http://localhost:8080/PROJECT/validate_admin"
				target="_top">Login</button>
		</form>
	</div>
</div>
</html>
