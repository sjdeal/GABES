<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="group.User" scope="session"/>
<html>
<head>
<title>List Of Bidders</title>
</head>
<body>
	<%
		if(!user.isLoggedIn())
			response.sendRedirect("../Login.html");
	%>
	
	<%@ page language="java" import="java.sql.*" %>
	

	<h1>Bidding Management</h1>
	
	My Bids</br>
	<%
    try {
    	System.out.println(user.getUserId());
    	ResultSet rs = user.getUsersBids(); 
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
	
</body>
	<%
            
    } catch (Exception E) {
            E.printStackTrace();
        }
    %> 

</html>