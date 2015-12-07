<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="salesSum" class="Views.SalesSummaryReport" /> 

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
		String prevCategory = "";
		while(rs.next()){
			prevCategory = rs.getString("category");
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
		<td align=right>$<%=rs.getDouble("commission")%><br>
		</td>
		</tr>
		<% 
		prevCategory = rs.getString("category");
		if(!prevCategory.equals(rs.getString("category"))){ //If we are in a new category, print subtotals for the last one
			salesSum.setCategory(prevCategory); 
    			ResultSet subtotalc = salesSum.subTotalComm();
			ResultSet subtotalp = salesSum.subTotalPrice();
			while(subtotalc.next()){
				while(subtotalp.next()){
				System.out.println("3" + rs.getString("category"));%>
		<tr>
		<td style="vertical-align: top; font-weight: bold;">SUB TOTAL<br>
		</td>
		<td style="vertical-align: top;font-weight: bold;"><br>
		</td>
		<td style="vertical-align: top;font-weight: bold;"><br>
		</td>
		<td align=right>$<%=subtotalp.getDouble("SUBTOTAL")%><br>
		</td>
		<td align=right>$<%=subtotalc.getDouble("SUBTOTAL")%><br>
 		</td> 
		</tr> 
		<%
		
				} 
			}
			subtotalc.close();
			subtotalp.close();
		}
		prevCategory = rs.getString("category"); //Hold on to this category to check if we need a subtotal
		}
		rs.close();
		
		//Print subtotals for the final category
		salesSum.setCategory(prevCategory);
    		ResultSet subtotalc = salesSum.subTotalComm();
		ResultSet subtotalp = salesSum.subTotalPrice();
		while(subtotalc.next()){
			while(subtotalp.next()){%>
		<tr>
		<td style="vertical-align: top;">SUBTOTAL<br>
		</td>
		<td style="vertical-align: top;font-weight: bold;"><br>
		</td>
		<td style="vertical-align: top;font-weight: bold;"><br>
		</td>
		<td align=right>$<%=subtotalp.getDouble("SUBTOTAL")%><br>
		</td>
		<td align=right>$<%=subtotalc.getDouble("SUBTOTAL")%><br>
 		</td> 
		</tr> 
		<%
		
			} 
		}
		subtotalc.close();
		subtotalp.close();
		//Print totals
		ResultSet totalc = salesSum.totalC();
		ResultSet totalp = salesSum.totalP();
		while(totalc.next()){
			while(totalp.next()){
		%> 
		<tr>
		<td style="vertical-align: top;font-weight: bold;">TOTAL<br>
		</td>
		<td style="vertical-align: top;font-weight: bold;"><br>
		</td>
		<td style="vertical-align: top;font-weight: bold;"><br>
		</td>
		<td align=right>$<%=totalp.getDouble("TOTAL")%><br>
		</td>
		<td align=right>$<%=totalc.getDouble("TOTAL")%><br>
 		</td> 
		</tr> 
		<%
		
		} 
		}
			totalc.close();
			totalp.close();

		%> 
		</tbody>
        </table>
        <br>
        <a href="adminMenu.html">Return to Menu</a><br>
        <br>
    </body>
</html>




