<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>List Of Bidders</title>
</head>
<body>
	<%@ page language="java" import="java.sql.*" %>
	<jsp:useBean id="bid" class="group.Bid" scope="session"/>

	<h1>Bidding Management</h1>
	
	My Bids</br>
<%
    try {
    	ResultSet rs = bid.getUsersBids(); 
    	while(rs.next()) {
    %>
    
    <table border = "1">
    <tr>
    <td> ITEM ID: <%=rs.getInt("ITEMID")%> </td>
    <td><form action="ShowItemInfo.jsp">
    	<input type="submit" value="View Item" style="color:black;">
	</form></td>
    </tr>

    </table>
    
    
    <br> My Purchased Items</br>
    
    <%}rs.close(); 
    rs = bid.getUsersBought(); 
    	while(rs.next()) {%>
    	
    <table border = "1">
    <tr>
    <td> ITEM ID: <%=rs.getInt("ITEMID")%></td>
    <td><form action="ShowItemInfo.jsp">
    	<input type="submit" value="View Item" style="color:black;">
	</form></td>
    
    </tr>
    </table>
	<%}rs.close(); %>

	<form action="ShowListOfBidders.jsp">
    	<input type="submit" value="Cancel" style="color:black;">
	</form>
	
</body>
	<%
            
    } catch (Exception E) {
            E.printStackTrace();
        }
    %> 

</html>