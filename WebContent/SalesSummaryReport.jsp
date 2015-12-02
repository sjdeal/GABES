<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="salesSum" class="Views.SalesSummaryReport" scope="session"/> 

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sales Summary Report</title>
        <h1 align = "center"> Sales Summary Report</h1>
    </head>
    
    <body>
		<table style="text-align: left; width: 100%;" border="1" cellpadding="2"
		cellspacing="2">
		<tbody>
		<tr>
		<td style="vertical-align: top; font-weight: bold; background-color: rgb(204, 204, 204);">Category<br>
		</td>
		<td style="vertical-align: top;font-weight: bold; background-color: rgb(204, 204, 204);">Item ID<br>
		</td>
		<td style="vertical-align: top;font-weight: bold; background-color: rgb(204, 204, 204);">Item Name<br>
		</td>
		<td style="vertical-align: top;font-weight: bold; background-color: rgb(204, 204, 204);">Selling Price<br>
		</td>
		<td style="vertical-align: top;font-weight: bold; background-color: rgb(204, 204, 204);">Commission<br>
		</td>
		
		</tr>
		<%
		ResultSet rs = salesSum.viewReport1();
		ResultSet total = salesSum.totalSales();
		while(rs.next()){
		%>
		<tr>
		<td style="vertical-align: top;"><%=rs.getString("category")%><br>
		</td>
		<td align=right><%=rs.getInt("itemId")%><br>
		</td>
		<td style="vertical-align: top;"><%=rs.getString("itemName")%><br>
		</td>
		<td align=right>$<%=rs.getDouble("selling_price")%><br>
		</td>
		<td align=right><%=rs.getDouble("commission")%><br>
		</td>
		</tr>
		<%
		}
		rs.close();
		%>
		<td style="vertical-align: top;font-weight: bold;">TOTAL<br>
		</td>
		<td style="vertical-align: top;font-weight: bold;"><br>
		</td>
		<td style="vertical-align: top;font-weight: bold;"><br>
		</td>
		<td style="vertical-align: top;font-weight: bold;"><br>
		</td>
<%-- 		<td style="vertical-align: top;font-weight: bold;"><%=total.getDouble(0)%><br> --%>
<!-- 		</td> -->
		</tbody>
        </table>
        <br>
        <a href="Menu.html">Return to Menu</a><br>
        <br>
    </body>
</html>




