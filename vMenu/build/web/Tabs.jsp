<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Tabs.css">
</head>
<body>
	<%@page import="java.sql.*"%>
	<%@page contentType="text/html" pageEncoding="UTF-8"%>
	<ul class="tab">
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openTab(event, 'Soup')">SOUPS</a></li>
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openTab(event, 'Salad')">SALADS</a></li>
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openTab(event, 'Starter')">STARTERS</a></li>
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openTab(event, 'Sizzler')">SIZZLERS</a></li>
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openTab(event, 'Pasta')">PASTAS</a></li>
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openTab(event, 'Roll & Sandwich')">ROLLS & SANDWICHES</a></li>
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openTab(event, 'Main Course')">MAIN COURSE</a></li>
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openTab(event, 'Dessert')">DESSERTS</a></li>
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openTab(event, 'Beverages')">BEVERAGES</a></li>
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openTab(event, 'Search')">SEARCH</a></li>
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openTab(event, 'Bill')">BILL</a></li>
	</ul>

	<%
		Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
	Statement st = con.createStatement();
	ResultSet rs = null;
	int i;
	%>


	<font color="#000000" size="4"> <br>
	<button class="button" onclick="billGenerate();">Place Order</button>
		<br>
	<br>

		<div id="Soup" class="tabcontent">
			<table>
				<tr>
					<th align="center"><b>Sr. No.</b></th>
					<th align="center"><b>Item Name</b></th>
					<th align="center"><b>Cost</b></th>
					<th align="center"><b>Quantity</b></th>
					<th align="center"><b>Selection</b></th>
				</tr>
				<%
					rs = st.executeQuery("select * from menu_items where category='Soup'");
				i = 1;
				while (rs.next()) {
				%>
				<tr>
					<td align="center"><%=i++%></td>
					<td align="left"><%=rs.getString("m_name")%></td>
					<td align="center"><%=rs.getString("m_cost")%></td>
					<td align="center"><input type="text"
						id="<%=rs.getInt("m_id")%>q" name="qty"></td>
					<td align="center"><input id="<%=rs.getInt("m_id")%>"
						onclick="menuSelect(this.id);" type="checkbox"></td>
				</tr>
				<font color=""><tr>
						<td colspan="1"><ul type="square">
								<li></li>
								<ul></td>
						<td colspan="2" align="left">(<%=rs.getString("m_desc")%>)
						</td>
					</tr> <%
 	}
 %>
			</table>
		</div>

		<div id="Salad" class="tabcontent">
			<table>
				<tr>
					<th align="center"><b>Sr. No.</b></th>
					<th align="center"><b>Item Name</b></th>
					<th align="center"><b>Cost</b></th>
					<th align="center"><b>Quantity</b></th>
					<th align="center"><b>Selection</b></th>
				</tr>
				<%
					rs = st.executeQuery("select * from menu_items where category='Salad'");
				i = 1;
				while (rs.next()) {
				%>
				<tr>
					<td align="center"><%=i++%></td>
					<td align="left"><%=rs.getString("m_name")%></td>
					<td align="center"><%=rs.getString("m_cost")%></td>
					<td align="center"><input type="text"
						id="<%=rs.getInt("m_id")%>q" name="qty"></td>
					<td align="center"><input id="<%=rs.getInt("m_id")%>"
						onclick="menuSelect(this.id);" type="checkbox"></td>
				</tr>
				<tr>
					<td colspan="1"><ul type="square">
							<li></li>
							<ul></td>
					<td colspan="2" align="left">(<%=rs.getString("m_desc")%>)
					</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>

		<div id="Starter" class="tabcontent">
			<table>
				<tr>
					<th align="center"><b>Sr. No.</b></th>
					<th align="center"><b>Item Name</b></th>
					<th align="center"><b>Cost</b></th>
					<th align="center"><b>Quantity</b></th>
					<th align="center"><b>Selection</b></th>
				</tr>
				<%
					rs = st.executeQuery("select * from menu_items where category='Starter'");
				i = 1;
				while (rs.next()) {
				%>
				<tr>
					<td align="center"><%=i++%></td>
					<td align="left"><%=rs.getString("m_name")%></td>
					<td align="center"><%=rs.getString("m_cost")%></td>
					<td align="center"><input type="text"
						id="<%=rs.getInt("m_id")%>q" name="qty"></td>
					<td align="center"><input id="<%=rs.getInt("m_id")%>"
						onclick="menuSelect(this.id);" type="checkbox"></td>
				</tr>
				<tr>
					<td colspan="1"><ul type="square">
							<li></li>
							<ul></td>
					<td colspan="2" align="left">(<%=rs.getString("m_desc")%>)
					</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>

		<div id="Sizzler" class="tabcontent">
			<table>
				<tr>
					<th align="center"><b>Sr. No.</b></th>
					<th align="center"><b>Item Name</b></th>
					<th align="center"><b>Cost</b></th>
					<th align="center"><b>Quantity</b></th>
					<th align="center"><b>Selection</b></th>
				</tr>
				<%
					rs = st.executeQuery("select * from menu_items where category='Sizzler'");
				i = 1;
				while (rs.next()) {
				%>
				<tr>
					<td align="center"><%=i++%></td>
					<td align="left"><%=rs.getString("m_name")%></td>
					<td align="center"><%=rs.getString("m_cost")%></td>
					<td align="center"><input type="text"
						id="<%=rs.getInt("m_id")%>q" name="qty"></td>
					<td align="center"><input id="<%=rs.getInt("m_id")%>"
						onclick="menuSelect(this.id);" type="checkbox"></td>
				</tr>
				<tr>
					<td colspan="1"><ul type="square">
							<li></li>
							<ul></td>
					<td colspan="2" align="left">(<%=rs.getString("m_desc")%>)
					</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>

		<div id="Pasta" class="tabcontent">
			<table>
				<tr>
					<th align="center"><b>Sr. No.</b></th>
					<th align="center"><b>Item Name</b></th>
					<th align="center"><b>Cost</b></th>
					<th align="center"><b>Quantity</b></th>
					<th align="center"><b>Selection</b></th>
				</tr>
				<%
					rs = st.executeQuery("select * from menu_items where category='Pasta'");
				i = 1;
				while (rs.next()) {
				%>
				<tr>
					<td align="center"><%=i++%></td>
					<td align="left"><%=rs.getString("m_name")%></td>
					<td align="center"><%=rs.getString("m_cost")%></td>
					<td align="center"><input type="text"
						id="<%=rs.getInt("m_id")%>q" name="qty"></td>
					<td align="center"><input id="<%=rs.getInt("m_id")%>"
						onclick="menuSelect(this.id);" type="checkbox"></td>
				</tr>
				<tr>
					<td colspan="1"><ul type="square">
							<li></li>
							<ul></td>
					<td colspan="2" align="left">(<%=rs.getString("m_desc")%>)
					</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>

		<div id="Roll & Sandwich" class="tabcontent">
			<table>
				<tr>
					<th align="center"><b>Sr. No.</b></th>
					<th align="center"><b>Item Name</b></th>
					<th align="center"><b>Cost</b></th>
					<th align="center"><b>Quantity</b></th>
					<th align="center"><b>Selection</b></th>
				</tr>
				<%
					rs = st.executeQuery("select * from menu_items where category='Roll & Sandwich'");
				i = 1;
				while (rs.next()) {
				%>
				<tr>
					<td align="center"><%=i++%></td>
					<td align="left"><%=rs.getString("m_name")%></td>
					<td align="center"><%=rs.getString("m_cost")%></td>
					<td align="center"><input type="text"
						id="<%=rs.getInt("m_id")%>q" name="qty"></td>
					<td align="center"><input id="<%=rs.getInt("m_id")%>"
						onclick="menuSelect(this.id);" type="checkbox"></td>
				</tr>
				<tr>
					<td colspan="1"><ul type="square">
							<li></li>
							<ul></td>
					<td colspan="2" align="left">(<%=rs.getString("m_desc")%>)
					</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>

		<div id="Main Course" class="tabcontent">
			<table>
				<tr>
					<th align="center"><b>Sr. No.</b></th>
					<th align="center"><b>Item Name</b></th>
					<th align="center"><b>Cost</b></th>
					<th align="center"><b>Quantity</b></th>
					<th align="center"><b>Selection</b></th>
				</tr>
				<%
					rs = st.executeQuery("select * from menu_items where category='Main Course'");
				i = 1;
				while (rs.next()) {
				%>
				<tr>
					<td align="center"><%=i++%></td>
					<td align="left"><%=rs.getString("m_name")%></td>
					<td align="center"><%=rs.getString("m_cost")%></td>
					<td align="center"><input type="text"
						id="<%=rs.getInt("m_id")%>q" name="qty"></td>
					<td align="center"><input id="<%=rs.getInt("m_id")%>"
						onclick="menuSelect(this.id);" type="checkbox"></td>
				</tr>
				<tr>
					<td colspan="1"><ul type="square">
							<li></li>
							<ul></td>
					<td colspan="2" align="left">(<%=rs.getString("m_desc")%>)
					</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>

		<div id="Dessert" class="tabcontent">
			<table>
				<tr>
					<th align="center"><b>Sr. No.</b></th>
					<th align="center"><b>Item Name</b></th>
					<th align="center"><b>Cost</b></th>
					<th align="center"><b>Quantity</b></th>
					<th align="center"><b>Selection</b></th>
				</tr>
				<%
					rs = st.executeQuery("select * from menu_items where category='Dessert'");
				i = 1;
				while (rs.next()) {
				%>
				<tr>
					<td align="center"><%=i++%></td>
					<td align="left"><%=rs.getString("m_name")%></td>
					<td align="center"><%=rs.getString("m_cost")%></td>
					<td align="center"><input type="text"
						id="<%=rs.getInt("m_id")%>q" name="qty"></td>
					<td align="center"><input id="<%=rs.getInt("m_id")%>"
						onclick="menuSelect(this.id);" type="checkbox"></td>
				</tr>
				<tr>
					<td colspan="1"><ul type="square">
							<li></li>
							<ul></td>
					<td colspan="2" align="left">(<%=rs.getString("m_desc")%>)
					</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>

		<div id="Beverages" class="tabcontent">
			<table>
				<tr>
					<th align="center"><b>Sr. No.</b></th>
					<th align="center"><b>Item Name</b></th>
					<th align="center"><b>Cost</b></th>
					<th align="center"><b>Quantity</b></th>
					<th align="center"><b>Selection</b></th>
				</tr>
				<%
					rs = st.executeQuery("select * from menu_items where category='Beverages'");
				i = 1;
				while (rs.next()) {
				%>
				<tr>
					<td align="center"><%=i++%></td>
					<td align="left"><%=rs.getString("m_name")%></td>
					<td align="center"><%=rs.getString("m_cost")%></td>
					<td align="center"><input type="text"
						id="<%=rs.getInt("m_id")%>q" name="qty"></td>
					<td align="center"><input id="<%=rs.getInt("m_id")%>"
						onclick="menuSelect(this.id);" type="checkbox"></td>
				</tr>
				<tr>
					<td colspan="1"><ul type="square">
							<li></li>
							<ul></td>
					<td colspan="2" align="left">(<%=rs.getString("m_desc")%>)
					</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>

		<div id="Search" class="tabcontent">
			<input type="text" class="mytext" id="myInput" onkeyup="myFunction()"
				placeholder="Search..">

			<ul id="myUL">
				<%
					rs = st.executeQuery("select * from menu_items");
				while (rs.next()) {
				%>
				<li><a href="#"><b>Item Name:</b><%=rs.getString("m_name")%>
						<p class="indent"></p>
						<b>Cost:</b><%=rs.getString("m_cost")%><p class="indent"></p>
						<b>Quantity:</b><input class="normal" type="text"
						id="<%=rs.getString("m_id")%>t">
					<p class="indent"></p>
						<b>Selection:</b><input type="checkbox"
						id="<%=rs.getString("m_id")%>s" onclick="searchMenu(this.id);"></a></li>
				<%
					}
				%>
			</ul>
		</div>
	</font>

	<div id="Bill" class="tabcontent">
		<%
			String c_id = (String) session.getAttribute("customer_id");
		rs = st.executeQuery("select sum(total) from ordr where c_id=" + c_id + "");
		if (rs.next()) {
		%>
		<table align="left" class="billtable">
			<tfoot class="billtfoot">
				<tr class="billtfoottr">
					<th colspan="3">Grand Total</th>
					<th colspan="2"><%=rs.getString(1)%></th>
				</tr>
			</tfoot>
		</table>
		<br>
		<br> <a href="Final_bill.jsp" class="button" target="_top">Checkout</a>



		<table align="center" class="billtable">
			<caption class="billcaption">BILL</caption>
			<thead class="billthead">
				<tr>
					<th class="billth">Item No.</th>
					<th class="billth">Item Name</th>
					<th class="billth">Quantity</th>
					<th class="billth">Price</th>
					<th class="billth">Total</th>
				</tr>
			</thead>
			<tbody>
				<%
					rs = st.executeQuery("select * from ordr where c_id=" + c_id + "");
				i = 1;
				while (rs.next()) {
				%>
				<tr class="billtbodytr">
					<td class="billtbodytd"><%=i++%></td>
					<td class="billtbodytd"><%=rs.getString("m_name")%></td>
					<td class="billtbodytd"><%=rs.getString("quantity")%></td>
					<td class="billtbodytd"><%=rs.getString("cost")%></td>
					<td class="billtbodytd"><%=rs.getString("total")%></td>
				</tr>
			</tbody>
			<%
				}
			}
			%>
		</table>



	</div>

	<script>
		function openTab(evt, cusine) {
			// Declare all variables
			var i, tabcontent, tablinks;

			// Get all elements with class="tabcontent" and hide them
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}

			// Get all elements with class="tablinks" and remove the class "active"
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" active", "");
			}

			// Show the current tab, and add an "active" class to the link that opened the tab
			document.getElementById(cusine).style.display = "block";
			evt.currentTarget.className += " active";
		}

		function myFunction() {
			// Declare variables
			var input, filter, ul, li, a, i;
			input = document.getElementById('myInput');
			filter = input.value.toUpperCase();
			ul = document.getElementById("myUL");
			li = ul.getElementsByTagName('li');

			// Loop through all list items, and hide those who don't match the search query
			for (i = 0; i < li.length; i++) {
				a = li[i].getElementsByTagName("a")[0];
				if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
					li[i].style.display = "";
				} else {
					li[i].style.display = "none";
				}
			}
		}

		var menu_id = new Array();
		var menu_qty = new Array();
		var j = 0;
		function menuSelect(id) {
			var k;
			var flag = true;
			var qty = document.getElementById(id + "q").value;
			if (qty == "") {
				document.getElementById(id).checked = false;
				alert("Please Enter Quantity Before Selection!");
			} else {
				for (k = 0; k < menu_id.length; k++) {
					if (id == menu_id[k]) {
						menu_id[k] = 0;
						menu_qty[k] = 0;
						document.getElementById(id + "q").value = "";
						flag = false;
						break;
					}
				}
				if (flag) {
					menu_id[j] = id;
					menu_qty[j++] = qty;
				}
			}
		}

		function searchMenu(id) {
			var mid = id.substring(0, id.length - 1);
			var l, flag1 = true;
			var qty1 = document.getElementById(mid + "t").value;
			if (qty1 == "") {
				document.getElementById(id).checked = false;
				alert("Please Enter Quantity Before Selection!");
			} else {
				for (l = 0; l < menu_id.length; l++) {
					if (mid == menu_id[l]) {
						menu_id[l] = 0;
						menu_qty[l] = 0;
						document.getElementById(mid + "t").value = "";
						flag1 = false;
						break;
					}
				}
				if (flag1) {
					menu_id[j] = mid;
					menu_qty[j++] = qty1;
				}
			}
		}

		function billGenerate() {
			var r = confirm("Do You Want To Place The Order?");
			var menuids = menu_id.toString();
			var menuqtys = menu_qty.toString();
			if (menuids != "") {
				if (r == true) {
					jspcall = "Billing.jsp?menuids=" + menuids + "&menuqtys="
							+ menuqtys + "";
					window.location.href = jspcall;
				} else {
					window.location.assign("Tabs.jsp");
				}
			} else
				window.location.assign("Tabs.jsp");
		}
	</script>
</body>
</html>
