<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Item Information</title>
</head>
<body>
	<%@ page language="java" import="java.sql.*" %>
	<jsp:useBean id="item" class="group.Item" scope="session"/>

	<h1>Item Information</h1>
<%
		
    try {
    	System.out.println(request.getParameter("transNum"));
    	item.setItemId(Integer.parseInt(request.getParameter("transNum")));
    	ResultSet rs = item.getItemInfo(); 
        while (rs.next()) {
    %>

	<!-- <form method="post" action="ShowItemInfo_Action" name="EditForm"> -->
	<table>
	<tr>
	<td>ITEM ID:</td>
	<td> <input readonly="readonly" name="ItemID" value="<%=rs.getInt("ITEMID")%>"> </td>
	</tr>
	
	<tr>
	<td>ITEM NAME:</td>
	<td> <input readonly="readonly" name="ItemName" value="<%=rs.getString("ITEMNAME")%>"> </td>
	</tr>
	
	<tr>
	<td>CATEGORY:</td>
	<td> <input readonly="readonly" name="Category" value="<%=rs.getString("CATEGORY")%>"> </td>
	</tr>
	
	<tr>
	<td>START PRICE:</td>
	<td> <input readonly="readonly" name="StartPrice" value="<%=rs.getString("STARTPRICE")%>"> </td>
	</tr>
	
	<tr>
	<td>AUCTION START:</td>
	<td> <input readonly="readonly" name="AuctionStart" value="<%=rs.getDate("AUCTIONSTART")%>"> </td>
	</tr>
	
	<tr>
	<td>AUCTION END: </td>
	<td> <input readonly="readonly" name="AuctionEnd" value="<%=rs.getDate("AUCTIONEND")%>"> </td>
	</tr>
	
	<tr>
	<td>DESCRIPTION: </td>
	<td> <input readonly="readonly" name="Description" value="<%=rs.getString("DESCRIPTION")%>"> <br> </td>
	</tr>
	
	</table>
     
     
    
    
    
    
         
   
    <table>
    <tr>
    <input type="submit" value="Bid on Item" style="color:black;">

    <form action="ShowListOfBidders.jsp" >
    	<input type="submit" value="View Bidder List" style="color:black;">
	</form>
	</tr>
    </table>
	<!--<input name="Submit" value="Edit Profile" type="submit"><br>
	 /form> -->
    
    <%
    
    %>

</body>
	<%
        }rs.close();
            
    } catch (Exception E) {
            E.printStackTrace();
        }
    %> 

</html>