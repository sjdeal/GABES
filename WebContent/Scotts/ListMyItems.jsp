<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<html>
<head>
<title>List Of Bidders</title>
<link rel="stylesheet" type="text/css" href="../CSS/format.css">
</head>
<jsp:useBean id="user" class="sjdeal.group.User" scope="session"/>
<jsp:useBean id="cust" class="sjdeal.group.Customer" />
<body>
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
		if(!user.isLoggedIn())
			response.sendRedirect("../Login.html");
	%>

	<h1>Bidding Management</h1>
	
	My Bids</br>
	<%
    try {
    	System.out.println(user.getUserId());
    	rs = user.getUsersBids(); 
    	while(rs.next()) {
    %>
    
    <table border = "1">
    <tr>
    <td> ITEM ID: <%=rs.getInt("ITEMID")%> </td>
    <td><form action="ShowItemInfo.jsp">
    	<input name="transNum" type="hidden" value ="<%=rs.getInt("ITEMID")%>">
    	<input type="submit" value="View Item" style="color:black;">
	</form></td>
    </tr>

    </table>
    
    
    <br> My Purchased Items</br>
    
    <%}rs.close(); 
    rs = user.getUsersBought(); 
    	while(rs.next()) {%>
    	
    <table border = "1">
    <tr>
    <td> ITEM ID: <%=rs.getInt("ITEMID")%></td>
    <td><form action="ShowItemInfo.jsp">
    	<input name="transNum" type="hidden" value ="<%=rs.getInt("ITEMID")%>">
    	<input type="submit" value="Leave Feedback" style="color:black;">
	</form></td>
    
    </tr>
    </table>
	<%}rs.close(); %>

	<form action="../menu.jsp">
    	<input type="submit" value="Back" style="color:black;">
	</form>
	<%
            
    } catch (Exception E) {
            E.printStackTrace();
        }
    %>
</body>
</html>