<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>List Of Bidders</title>
<jsp:useBean id="user" class="group.User" scope="session"/>
<jsp:useBean id="cust" class="group.Customer" />
<link rel="stylesheet" type="text/css" href="../CSS/format.css">
<body>
	<%@ page language="java" import="java.sql.*" %>
	<jsp:useBean id="bid" class="group.Bid" />
	<jsp:setProperty name="bid" property="*"/>

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
	<h1>List Of Bidders</h1>
<%
	System.out.println(bid.getItemId());	
    try {
    	rs = bid.getBiddersList(); 
    	if(rs.next()) {
    %>

	<table>
	<tr>
		<td> ITEM ID: <%=rs.getInt("ITEMID")%> </td>
	</tr>
	<tr>
		<td> <%=rs.getDate("AUCTIONSTART")%> - <%=rs.getDate("AUCTIONEND")%> </td>
	</tr>
	</table>	
	
	<br>
	<br>
	<table border = "1">
	<tr class="first-row">
	<td> Bidding Time:</td>
	<td> USER NAME:</td>
	<td> Bidding Price:</td>
	</tr>
	
	<% }rs = bid.getBiddersList(); 
    	while (rs.next()) { %>
	
	<tr>
	<td> <input readonly="readonly" name="BidDate" value="<%=rs.getDate("BidDate")%>">  </td>
	<td> <input readonly="readonly" name="UserName" value="<%=rs.getString("USERNAME")%>">  </td>
	<td> <input readonly="readonly" name="MaxBid" value="<%=rs.getString("MAXBID")%>">   </td>
	</tr>
	<%} %>
	</table>

	
	<form method="post" action="ShowItemInfo.jsp">
		<input name="transNum" type="hidden" value ="<%=rs.getInt("ITEMID")%>">
		<input value="Cancel" type="submit" style="color:black;"><br>
	</form>  
	<%rs.close(); 
        
            
    } catch (Exception E) {
            E.printStackTrace();
        }
    %> 
</body>
	
    
</body>
</html>