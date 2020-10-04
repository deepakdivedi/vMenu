<!DOCTYPE html>
<html>
<head>
<title>Feedback</title>
<!-- Include CSS file here -->
<link href="Feedbackform.css" rel="stylesheet">
</head>
<body>
	<div id="main">
		<h1>Thank you for Visiting Us !</h1>
		<h3>Your Feedback is Valuable to Us!</h3>
		<div id="feedback_form"></div>
		<form method="post" action="Add_feedback.jsp">
			<h2>Feedback Form</h2>
			<hr>
			<br> Your Name:<input type="text" name="name" value="">
			<br> Email Id:<input type="text" name="email" value="">
			<br> Your Message:
			<textarea name="message" value=""></textarea>
			<br> <input type="submit" value="submit" name="Submit">
		</form>
	</div>
</body>
</html>
