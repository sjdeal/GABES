<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="overall" class="Views.OverallCommissionReport" /> 
<jsp:useBean id="user" class="group.User" scope="session"/>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Overall Commission Report</title>
		<link rel="stylesheet" type="text/css" href="./CSS/format.css">
    </head>
    
    <body>
   		<%
			if(!user.isLoggedIn())
				response.sendRedirect("Login.html");
		%>
		<div class="header-container">
			<div class="header">
			GABES
			</div>
			<div class="header2">
				Welcome, Admin
			</div>
		</div>
		<h1 align = "center"> Overall Commission Report</h1>
		<table style="text-align: left; width: 100%;" border="1" cellpadding="2"
		cellspacing="2">
		<tbody>
		<tr class="first-row">
		<td style="vertical-align: top;">User ID<br>
		</td>
		<td style="vertical-align: top;">Username<br>
		</td>
		<td style="vertical-align: top;">First Name<br>
		</td>
		<td style="vertical-align: top;">Last Name<br>
		</td>
		<td style="vertical-align: top;">Email<br>
		</td>
		<td style="vertical-align: top;">Seller Rating<br>
		</td>
		<td style="vertical-align: top;">Commission<br>
		</td>
		</tr>
		<%
		ResultSet rs = overall.viewReport2();
		while(rs.next()){
		%>
		<tr>
		<td style="vertical-align: top;"><%=rs.getString("userID")%><br>
		</td>
		<td style="vertical-align: top;"><%=rs.getString("username")%><br>
		</td>
		<td style="vertical-align: top;"><%=rs.getString("fname")%><br>
		</td>
		<td style="vertical-align: top;"><%=rs.getString("lname")%><br>
		</td>
		<td style="vertical-align: top;"><%=rs.getString("email")%><br>
		</td>
		<td align=right>$<%=rs.getInt("sellerRating")%><br>
		</td>
		<td align=right><%=rs.getDouble("commissions")%><br>
		</td>
		</tr>
		<%
		}
		rs.close();
		ResultSet total = overall.total();
		while(total.next()){
		%> 
		<tr>
		<td style="vertical-align: top;font-weight: bold;">TOTAL<br>
		</td>
		<td style="vertical-align: top;font-weight: bold;"><br>
		</td>
		<td style="vertical-align: top;font-weight: bold;"><br>
		</td>
		<td align=right><br>
		</td>
		<td align=right><br>
		</td>
		<td align=right><br>
		</td>
		<td align=right>$<%=total.getDouble("TOTAL")%><br>
 		</td> 
		</tr> 
		<%
		
		} 
			total.close();
%>
		</tbody>
        </table>
        <br>
        <a href="adminMenu.jsp">Return to Menu</a><br>
        <br>
    </body>
</html>




