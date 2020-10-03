<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Login_page.css">
</head>
<div class="login-page">
	<div class="form">
		<form class="login-form" method="post"
			action="http://localhost:8080/PROJECT/validate_customer">
			<table>
				<tr>
					<td align="left"><font color="Whitesmoke">Name:</font></td>
					<td><input type="text" placeholder="Name" name="name" /></td>
				</tr>
				<tr>
					<td align="left"><font color="Whitesmoke">Mobile No.:</font></td>
					<td><input type="text" placeholder="Mobile No."
						name="mobileno" /></td>
				</tr>
				<tr>
					<td align="left"><font color="Whitesmoke">Table No.:</font></td>
					<td align="left"><select name="table">
							<option value="0"></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
					</select></td>
				</tr>
			</table>
			<button class="button"
				formaction="http://localhost:8080/PROJECT/validate_customer"
				target="_top">Login</button>
		</form>
	</div>
</div>
</html>
