<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Admin_update_page.css">
</head>
<body>
</body>
<ul class="tab">
  <li><a href="javascript:void(0)" class="tablinks" onclick="openClicked(event, 'updateStaff')">Update Staff</a></li>
  <li><a href="javascript:void(0)" class="tablinks" onclick="openClicked(event, 'updateMenu')">Update Menu</a></li>
  <li><a href="javascript:void(0)" class="tablinks" onclick="openClicked(event, 'displayStaff')">Display Staff</a></li>
  <li><a href="javascript:void(0)" class="tablinks" onclick="openClicked(event, 'displayMenu')">Display Menu</a></li>
  <li style="float:right"><a href="Home_page.jsp" class="tablinks" target="_top">Logout</a></li>
</ul>

<div id="updateStaff" class="tabcontent">
  <h3>Check appropriate option</h3>

<fieldset>
    <legend><input type="radio" name="process" value="UpdateStaff" onclick="displayStaffForm(this)"> Update Staff<br></legend>
<form style="visibility:hidden" id="uform" method="post" action="http://localhost:8080/PROJECT/update_staff?id=add">
<table>
<tr>
    <td align="right">Staff Name: </td><td align="left"><input type="text" name="staffname"></td>
</tr>
<tr>
    <td align="right">Mobile Number: </td><td align="left"><input type="text" name="mobileno"></td>
</tr>
<tr>
    <td align="right">Staff Id: </td><td align="left"><input type="text" name="staffid"></td>
</tr>
<tr>
    <td align="right">Staff Password: </td><td align="left"><input type="text" name="staffpwd"></td>
</tr>
<tr>
    <td align="right">Address: </td><td align="left"><input type="text" name="address"></td>
</tr>
<tr>
    <td align="right"><p><input type="submit" value="Add" class="button"></p></td><td align="left"><p><input type="reset" value="Reset" class="button"></p></td>
</tr>
</table>
</form>
</fieldset><p></p> 

<fieldset>
    <legend><input type="radio" name="process" value="DeleteStaff" onclick="displayStaffForm(this)"> Delete Staff<br></legend>
<form style="visibility:hidden" id="dform" method="post" action="http://localhost:8080/PROJECT/update_staff?id=delete">
<table>
<tr>
    <td align="right">Staff Name: </td><td align="left"><input type="text" name="staffname"></td>
</tr>
<tr>
    <td align="right">Staff Id: </td><td align="left"><input type="text" name="staffid"></td>
</tr>
<tr>
    <td align="right"><p><input type="submit" value="Delete" class="button"></p></td><td align="left"><p><input type="reset" value="Reset" class="button"></p></td>
</tr>
</table>  
</form>
</fieldset><p></p>

</div>

<div id="updateMenu" class="tabcontent">
  <h3>Check appropriate option</h3>
  
<fieldset>
    <legend><input type="radio" name="process" value="AddMenu" onclick="displayMenuForm(this)"> Add Menu<br></legend>
<form style="visibility:hidden" id="amform" method="post" action="http://localhost:8080/PROJECT/update_menu?id=add">
<table>
<tr>
    <td align="right">Menu Name: </td><td align="left"><input type="text" name="menuname"></td>
</tr>
<tr>
    <td align="right">Cost: </td><td align="left"><input type="text" name="mcost"></td>
</tr>
<tr>
    <td align="right">Category: </td><td align="left"><input type="text" name="category"></td>
</tr>
<tr>
    <td align="right">Description: </td><td align="left"><input type="text" name="desc"></td>
</tr>
<tr>
    <td align="right"><p><input type="submit" value="Add" class="button"></p></td><td align="left"><p><input type="reset" value="Reset" class="button"></p></td>
</tr>
</table>
</form>
</fieldset><p></p>

<fieldset>
    <legend><input type="radio" name="process" value="UpdateMenu" onclick="displayMenuForm(this)"> Update Menu<br></legend>
<form style="visibility:hidden" id="umform" method="post" action="http://localhost:8080/PROJECT/update_menu?id=update">
<table>
<tr>
    <td align="right">Menu Name: </td><td align="left"><input type="text" name="menuname" ></td>
</tr>
<tr>
    <td align="right">Cost: </td><td align="left"><input type="text" name="cost" ></td>
</tr>
<tr>
    <td align="right"><p><input type="submit" value="Update" class="button"></p></td><td align="left"><p><input type="reset" value="Reset" class="button"></p></td>
</tr>
</table>
</form>    
</fieldset><p></p>

<fieldset>
    <legend><input type="radio" name="process" value="DeleteMenu" onclick="displayMenuForm(this)"> Delete Menu<br></legend>
<form style="visibility:hidden" id="dmform" method ="post" action="http://localhost:8080/PROJECT/update_menu?id=delete">
<table>
<tr>
    <td align="right">Menu Name: </td><td align="left"><input type="text" name="menuname">
</tr>
<tr>
    <td align="right"><p><input type="submit" value="Delete" class="button"></p></td><td align="left"><p><input type="reset" value="Reset" class="button"></p></td>
</tr>
</table>
</form>    
</fieldset><p></p>
 
</div>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
    Statement st=con.createStatement();
    ResultSet rs=null;
    int i;
%>

<div id="displayStaff" class="tabcontent">
  <table>
        <tr>
        <td align="center"><b>Staff Id</b></td><td align="center"><b>Staff Name</b></td><td align="center"><b>Staff Password</b></td><td align="center"><b>Staff Address</b></td><td align="center"><b>Staff Mb. no.</b></td>
        </tr>
        <%
            rs=st.executeQuery("select * from staff");
            while(rs.next()){
        %>
        <tr>
            <td align="center"><%= rs.getString("s_id") %></td><td align="center"><%= rs.getString("s_name") %></td><td align="center"><%= rs.getString("s_pass") %></td><td align="center"><%= rs.getString("s_addr") %></td><td align="center"><%= rs.getString("s_no") %></td>
        </tr>
        
        <%
            }
        %>
            </table>  
</div>

<div id="displayMenu" class="tabcontent">
    <table>
        <tr>
        <td align="center"><b>Sr. No.</b></td><td align="center"><b>Item Name</b></td><td align="center"><b>Cost</b></td>
        </tr>
        <%
            rs=st.executeQuery("select * from menu_items");
            i=1;
            while(rs.next()){
        %>
        <tr>
            <td align="center"><%= i++ %></td><td align="left"><%= rs.getString("m_name") %></td><td align="center"><%= rs.getString("m_cost") %></td>
        </tr>
        <font color=""><tr><td colspan="1"><ul type="square"><li></li><ul></td><td colspan="2" align="left">(<%= rs.getString("m_desc") %>)</td></tr>
        <%
            }
        %>
            </table>
</div>

<script>
function openClicked(evt, workName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(workName).style.display = "block";
    evt.currentTarget.className += " active";
}

 function displayMenuForm(c){ 
            if(c.value == "AddMenu"){ 
	document.getElementById("amform").style.visibility='visible'; 
	document.getElementById("dmform").style.visibility='hidden';
	document.getElementById("umform").style.visibility='hidden'; 
            } 
            else if(c.value =="DeleteMenu"){ 
	document.getElementById("amform").style.visibility='hidden'; 
	document.getElementById("dmform").style.visibility='visible';
	document.getElementById("umform").style.visibility='hidden';
            } 
            else if(c.value =="UpdateMenu"){ 
	document.getElementById("amform").style.visibility='hidden'; 
	document.getElementById("dmform").style.visibility='hidden';
	document.getElementById("umform").style.visibility='visible'; 
            } 
            else{}
}         

 function displayStaffForm(c){ 
            if(c.value == "UpdateStaff"){ 
	document.getElementById("uform").style.visibility='visible'; 
	document.getElementById("dform").style.visibility='hidden'; 
            } 
            else if(c.value =="DeleteStaff"){ 
        document.getElementById("uform").style.visibility='hidden'; 
	document.getElementById("dform").style.visibility='visible'; 
            } 
}         
</script>
    
</body>
</html> 
