<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Item Information</title>
<link rel="stylesheet" type="text/css" href="../CSS/format.css">
</head>
<jsp:useBean id="item" class="group.Item" />
<jsp:useBean id="user" class="group.User" scope="session"/>
<jsp:useBean id="cust" class="group.Customer" />
<body>
	<%@ page language="java" import="java.sql.*" %>

	<%
			if(!user.isLoggedIn())
				response.sendRedirect("../Login.html");
			cust.setUserId(user.getUserId());
			ResultSet rs = cust.getCustomer();
			if(rs.next()){
				cust.setFName(rs.getString("fName"));
			}
		%>
		<div class="header-container">
			<div class="header">
			GABES
			</div>
			<div class="header2">
				Welcome, <%=cust.getFName() %>
			</div>
		</div> 
	
	<h1>Item Information</h1>
<%
		
    try {
    	System.out.println(request.getParameter("transNum"));
    	item.setItemId(Integer.parseInt(request.getParameter("transNum")));
    	rs = item.getItemInfo(); 
        while (rs.next()) {
    %>
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
<<<<<<< HEAD
    	<td>
    	<form action="../Bid/Bid.jsp" >
    	<input type="submit" value="Bid on Item" style="color:black;">
    	</form>
		</td>
		<td>
=======
    	<form method="post" action="../Bid/Bid.jsp">
	                            <input name="transNum" type="hidden" value ="<%=rs.getInt("ITEMID")%>">
	                            <input value="Bid" type="submit" style="color:black;">
	                        </form>

>>>>>>> f899b625f083dfbd5d611a39e377f452dae62c7a
    	<form action="ShowListOfBidders.jsp" >
    		<input type="hidden" name="itemId" value="<%=rs.getInt("ITEMID") %>">
    		<input type="submit" value="View Bidder List" style="color:black;">
		</form>
<<<<<<< HEAD
		</td>
		<td>
=======
	
>>>>>>> f899b625f083dfbd5d611a39e377f452dae62c7a
		<form action="../SellingManagement.jsp" >
    		<input type="submit" value="Cancel" style="color:black;">
		</form>
		</td>
		</tr>
    </table>
    <%
        }rs.close();
            
    } catch (Exception E) {
            E.printStackTrace();
        }
    %>
</body>
	 

</html>