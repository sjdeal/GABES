<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="overall" class="Views.OverallCommissionReport" scope="session"/> 

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Overall Commission Report</title>
        <h1 align = "center"> Overall Commission Report</h1>
    </head>
    
    <body>
		<table style="text-align: left; width: 100%;" border="1" cellpadding="2"
		cellspacing="2">
		<tbody>
		<tr>
		<td style="vertical-align: top; font-weight: bold; background-color: rgb(204, 204, 204);">User ID<br>
		</td>
		<td style="vertical-align: top;font-weight: bold; background-color: rgb(204, 204, 204);">Username<br>
		</td>
		<td style="vertical-align: top;font-weight: bold; background-color: rgb(204, 204, 204);">First Name<br>
		</td>
		<td style="vertical-align: top;font-weight: bold; background-color: rgb(204, 204, 204);">Last Name<br>
		</td>
		<td style="vertical-align: top;font-weight: bold; background-color: rgb(204, 204, 204);">Email<br>
		</td>
		<td style="vertical-align: top;font-weight: bold; background-color: rgb(204, 204, 204);">Seller Rating<br>
		</td>
		<td style="vertical-align: top;font-weight: bold; background-color: rgb(204, 204, 204);">Commission<br>
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
		<td align=right><%=rs.getInt("sellerrating")%><br>
		</td>
		<td align=right>$<%=rs.getDouble("commissions")%><br>
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
        <a href="adminMenu.html">Return to Menu</a><br>
        <br>
    </body>
</html>




