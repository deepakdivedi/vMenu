<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="Tabs.css">
</head>
<body>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<ul class="tab">
  <li><a href="javascript:void(0)" class="tablinks" onclick="openTab(event, 'Soup')">SOUPS</a></li>
  <li><a href="javascript:void(0)" class="tablinks" onclick="openTab(event, 'Salad')">SALADS</a></li>
  <li><a href="javascript:void(0)" class="tablinks" onclick="openTab(event, 'Starter')">STARTERS</a></li>
  <li><a href="javascript:void(0)" class="tablinks" onclick="openTab(event, 'Sizzler')">SIZZLERS</a></li>
  <li><a href="javascript:void(0)" class="tablinks" onclick="openTab(event, 'Pasta')">PASTAS</a></li> 
  <li><a href="javascript:void(0)" class="tablinks" onclick="openTab(event, 'Roll & Sandwich')">ROLLS & SANDWICHES</a></li>
  <li><a href="javascript:void(0)" class="tablinks" onclick="openTab(event, 'Main Course')">MAIN COURSE</a></li>
  <li><a href="javascript:void(0)" class="tablinks" onclick="openTab(event, 'Dessert')">DESSERTS</a></li>
  <li><a href="javascript:void(0)" class="tablinks" onclick="openTab(event, 'Beverages')">BEVERAGES</a></li>
  <li><a href="javascript:void(0)" class="tablinks" onclick="openTab(event, 'Search')">SEARCH</a></li>
</ul>

<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
    Statement st=con.createStatement();
    ResultSet rs=null;
    int i;
%>

<font color="#000000" size="4">
<div id="Soup" class="tabcontent">
<table>
        <tr>
        <td align="center"><b>Sr. No.</b></td><td align="center"><b>Item Name</b></td><td align="center"><b>Cost</b></td>
        </tr>
        <%
            rs=st.executeQuery("select * from menu_items where category='Soup'");
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

<div id="Salad" class="tabcontent">
<table>
        <tr>
        <td align="center"><b>Sr. No.</b></td><td align="center"><b>Item Name</b></td><td align="center"><b>Cost</b></td>
        </tr>
        <%
            rs=st.executeQuery("select * from menu_items where category='Salad'");
            i=1;
            while(rs.next()){
        %>
        <tr>
            <td align="center"><%= i++ %></td><td align="left"><%= rs.getString("m_name") %></td><td align="center"><%= rs.getString("m_cost") %></td>      
        </tr>
        <tr><td colspan="1"><ul type="square"><li></li><ul></td><td colspan="2" align="left">(<%= rs.getString("m_desc") %>)</td></tr>
        <%
            }
        %>
            </table>
</div>

<div id="Starter" class="tabcontent">
<table>
        <tr>
        <td align="center"><b>Sr. No.</b></td><td align="center"><b>Item Name</b></td><td align="center"><b>Cost</b></td>
        </tr>
        <%
            rs=st.executeQuery("select * from menu_items where category='Starter'");
            i=1;
            while(rs.next()){
        %>
        <tr>
            <td align="center"><%= i++ %></td><td align="left"><%= rs.getString("m_name") %></td><td align="center"><%= rs.getString("m_cost") %></td>
        </tr>
        <tr><td colspan="1"><ul type="square"><li></li><ul></td><td colspan="2" align="left">(<%= rs.getString("m_desc") %>)</td></tr>
        <%
            }
        %>
            </table>
</div>

<div id="Sizzler" class="tabcontent">
<table>
        <tr>
        <td align="center"><b>Sr. No.</b></td><td align="center"><b>Item Name</b></td><td align="center"><b>Cost</b></td>
        </tr>
        <%
            rs=st.executeQuery("select * from menu_items where category='Sizzler'");
            i=1;
            while(rs.next()){
        %>
        <tr>
            <td align="center"><%= i++ %></td><td align="left"><%= rs.getString("m_name") %></td><td align="center"><%= rs.getString("m_cost") %></td>
        </tr>
        <tr><td colspan="1"><ul type="square"><li></li><ul></td><td colspan="2" align="left">(<%= rs.getString("m_desc") %>)</td></tr>
        <%
            }
        %>
            </table>
</div>

<div id="Pasta" class="tabcontent">
<table>
        <tr>
        <td align="center"><b>Sr. No.</b></td><td align="center"><b>Item Name</b></td><td align="center"><b>Cost</b></td>        
        </tr>
        <%
            rs=st.executeQuery("select * from menu_items where category='Pasta'");
            i=1;
            while(rs.next()){
        %>
        <tr>
            <td align="center"><%= i++ %></td><td align="left"><%= rs.getString("m_name") %></td><td align="center"><%= rs.getString("m_cost") %></td>
        </tr>
        <tr><td colspan="1"><ul type="square"><li></li><ul></td><td colspan="2" align="left">(<%= rs.getString("m_desc") %>)</td></tr>
        <%
            }
        %>
            </table>
</div>

<div id="Roll & Sandwich" class="tabcontent">
<table>
        <tr>
        <td align="center"><b>Sr. No.</b></td><td align="center"><b>Item Name</b></td><td align="center"><b>Cost</b></td>
        </tr>
        <%
            rs=st.executeQuery("select * from menu_items where category='Roll & Sandwich'");
            i=1;
            while(rs.next()){
        %>
        <tr>
            <td align="center"><%= i++ %></td><td align="left"><%= rs.getString("m_name") %></td><td align="center"><%= rs.getString("m_cost") %></td>
        </tr>
        <tr><td colspan="1"><ul type="square"><li></li><ul></td><td colspan="2" align="left">(<%= rs.getString("m_desc") %>)</td></tr>
        <%
            }
        %>
            </table>
</div>

<div id="Main Course" class="tabcontent">
<table>
        <tr>
        <td align="center"><b>Sr. No.</b></td><td align="center"><b>Item Name</b></td><td align="center"><b>Cost</b></td>
        </tr>
        <%
            rs=st.executeQuery("select * from menu_items where category='Main Course'");
            i=1;
            while(rs.next()){
        %>
        <tr>
            <td align="center"><%= i++ %></td><td align="left"><%= rs.getString("m_name") %></td><td align="center"><%= rs.getString("m_cost") %></td>
        </tr>
        <tr><td colspan="1"><ul type="square"><li></li><ul></td><td colspan="2" align="left">(<%= rs.getString("m_desc") %>)</td></tr>
        <%
            }
        %>
            </table>
</div>

<div id="Dessert" class="tabcontent">
<table>
        <tr>
        <td align="center"><b>Sr. No.</b></td><td align="center"><b>Item Name</b></td><td align="center"><b>Cost</b></td>
        </tr>
        <%
            rs=st.executeQuery("select * from menu_items where category='Dessert'");
            i=1;
            while(rs.next()){
        %>
        <tr>
            <td align="center"><%= i++ %></td><td align="left"><%= rs.getString("m_name") %></td><td align="center"><%= rs.getString("m_cost") %></td>
        </tr>
        <tr><td colspan="1"><ul type="square"><li></li><ul></td><td colspan="2" align="left">(<%= rs.getString("m_desc") %>)</td></tr>
        <%
            }
        %>
            </table>
</div>

<div id="Beverages" class="tabcontent">
<table>
        <tr>
        <td align="center"><b>Sr. No.</b></td><td align="center"><b>Item Name</b></td><td align="center"><b>Cost</b></td>
        </tr>
        <%
            rs=st.executeQuery("select * from menu_items where category='Beverages'");
            i=1;
            while(rs.next()){
        %>
        <tr>
            <td align="center"><%= i++ %></td><td align="left"><%= rs.getString("m_name") %></td><td align="center"><%= rs.getString("m_cost")%></td>
        </tr>
        <tr><td colspan="1"><ul type="square"><li></li><ul></td><td colspan="2" align="left">(<%= rs.getString("m_desc") %>)</td></tr>
        <%
            }
        %>
            </table>
</div>

<div id="Search" class="tabcontent">
<input type="text" class="mytext" id="myInput" onkeyup="myFunction()" placeholder="Search..">

<ul id="myUL">
        <%
           rs=st.executeQuery("select * from menu_items");
           while(rs.next()){
        %>
        <li><a href="#"><b>Item Name:</b><%= rs.getString("m_name") %> <p class="indent"></p> <b>Cost:</b><%= rs.getString("m_cost") %></a></li>
        <%
            }
        %>
</ul>
</div>

</font>

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
        tablinks[i].className = tablinks[i].className.replace(" active", "");
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
</script>
</body>
</html>
