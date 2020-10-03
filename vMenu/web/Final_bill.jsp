<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Final_bill.css">
</head>
<body>
	<%
		String c_id = (String) session.getAttribute("customer_id");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
	Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	ResultSet rs = st.executeQuery("select * from ordr where c_id=" + c_id + "");
	%>
	<div id="wrap">
		<div id="accordian">
			<div class="step" id="step1">
				<div class="number">
					<span>1</span>
				</div>
				<div class="title">
					<h1>Bill Details</h1>
				</div>
				<div class="modify">
					<i class="fa fa-plus-circle"></i>
				</div>
			</div>
			<div class="content" id="final_products">
				<div class="left" id="ordered">
					<div class="products">
						<%
							while (rs.next()) {
						%>
						<div class="product_details">
							<span class="product_name"><%=rs.getString("m_name")%></span> <span
								class="quantity"><%=rs.getString("quantity")%></span> <span
								class="price"><%=rs.getString("cost")%></span> <span
								class="price"><%=rs.getString("total")%></span>
						</div>

						<%
							}
						rs = st.executeQuery("select sum(total) from ordr where c_id=" + c_id + "");
						rs.next();
						float subtotal = rs.getFloat(1);
						float vat = subtotal * .15f;
						float total = subtotal + vat;
						%>
					</div>
					<div class="totals">
						<span class="subtitle">Subtotal <span id="sub_price">
								: <%=subtotal%></span></span> <span class="subtitle">15% VAT <span
							id="sub_tax"> : <%=vat%></span></span>
					</div>
					<div class="final">
						<span class="title">Total <span id="calculated_total">
								: <%=total%></span></span>
					</div>
				</div>



				<div class="step" id="step2">
					<div class="number">
						<span>2</span>
					</div>
					<div class="title">
						<h1>Payment Information</h1>
					</div>
					<div class="modify">
						<i class="fa fa-plus-circle"></i>
					</div>
				</div>

				<div class="content" id="payment">
					<div class="left credit_card">
						<h1>
							<input type="radio" name="payment" id="card_selection"
								value="Card Payment" onclick="displayCard();"><b><i>Card
									Payment</i></b>
						</h1>
						<br>
						<form class="go-right" id="cardform" style="visibility: hidden">
							<div>
								<input type="text" name="card_number" value="" id="card_number"
									placeholder="xxxx-xxxx-xxxx-xxxx" data-trigger="change"
									data-validation-minlength="1" data-type="name"
									data-required="true"
									data-error-message="Enter Your Credit Card Number" /><label
									for="card_number">Card Number</label>
							</div>
							<div>
								<div class="expiry">
									<div class="month_select">
										<select name="exp_month" value="" id="exp_month"
											placeholder="" data-trigger="change" data-type="name"
											data-required="true"
											data-error-message="Enter Your Credit Card Expiration Date">
											<option value=""></option>
											<option value="Jan">Jan</option>
											<option value="Feb">Feb</option>
											<option value="Mar">Mar</option>
											<option value="Apr">Apr</option>
											<option value="May">May</option>
											<option value="Jun">Jun</option>
											<option value="Jul">Jul</option>
											<option value="Aug">Aug</option>
											<option value="Sep">Sep</option>
											<option value="Oct">Oct</option>
											<option value="Nov">Nov</option>
											<option value="Dec">Dec</option>
										</select>
									</div>
									<span class="divider">-</span>
									<div class="year_select">
										<select name="exp_year" value="" id="exp_year" placeholder=""
											data-trigger="change" data-type="name" data-required="true"
											data-error-message="Enter Your Credit Card Expiration Date">
											<option value=""></option>
											<option value="2018">2018</option>
											<option value="2019">2019</option>
											<option value="2020">2020</option>
											<option value="2021">2021</option>
											<option value="2022">2022</option>
											<option value="2023">2023</option>
											<option value="2024">2024</option>
											<option value="2025">2025</option>
											<option value="2026">2026</option>
											<option value="2027">2027</option>
											<option value="2028">2028</option>
											<option value="2029">2029</option>
											<option value="2030">2030</option>
										</select>
									</div>
								</div>
								<label class="exp_date" for="Exp_Date">Exp Date</label>
							</div>
							<div class="sec_num">
								<div>
									<input type="text" name="code" value="" id="ccvcode"
										placeholder="123" data-trigger="change"
										data-validation-minlength="3" data-type="name"
										data-required="true"
										data-error-message="Enter Your Card Security Code" /> <label
										for="code">Security Code</label>
								</div>
							</div>
						</form>
					</div>
					<br>
					<div class="right">
						<div class="accepted">
							<h1>
								<input type="radio" name="payment" value="Cash"
									id="cash_selection" onclick="displayCard();"><b><i>Cash</i></b>
							</h1>
							<br>
						</div>

					</div>

					<button class="continue" onclick="pay();">Complete Order</button>

				</div>

			</div>

			<script>
				function displayCard() {
					if (document.getElementById("card_selection").checked)
						document.getElementById("cardform").style.visibility = 'visible';
					else if (document.getElementById("cash_selection").checked)
						document.getElementById("cardform").style.visibility = 'hidden';
				}

				function pay() {
					var r = confirm("Do You Want To Confirm Your Payment?");
					if (r == true) {
						if (document.getElementById("card_selection").checked) {
							card_pay();
						} else if (document.getElementById("cash_selection").checked) {
							jspcall = "Payment.jsp?mode=cash";
							window.location.href = jspcall;
						} else if (document.getElementById("cash_selection").checked == false
								|| document.getElementById("card_selection").checked == false) {
							alert("Please Select An Option For Payment!");
							window.location.assign("Final_bill.jsp");
						}
					} else {
						window.location.assign("Final_bill.jsp");
					}
				}

				function card_pay() {
					var card_no = document.getElementById("card_number").value;
					var month = document.getElementById("exp_month").value;
					var year = document.getElementById("exp_year").value;
					var cno = document.getElementById("ccvcode").value;
					if ((card_no == "") || (month == "") || (year == "")
							|| (cno == "")) {
						alert("Please Enter Card Details!");
						window.location.assign("Final_bill.jsp");
					} else {
						jspcall = "Payment.jsp?&mode=card";
						window.location.href = jspcall;
					}
				}
			</script>
</body>
</html>
