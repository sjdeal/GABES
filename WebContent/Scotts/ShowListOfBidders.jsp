<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>List Of Bidders</title>
<jsp:useBean id="user" class="group.User" scope="session"/>
</head>
<body>
	<%@ page language="java" import="java.sql.*" %>
	<jsp:useBean id="bid" class="group.Bid" />
	<jsp:setProperty name="bid" property="*"/>

	<%
		if(!user.isLoggedIn())
			response.sendRedirect("Login.html");
	%>  
	<h1>List Of Bidders</h1>
<%
	System.out.println(bid.getItemId());	
    try {
    	ResultSet rs = bid.getBiddersList(); 
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
	<tr>
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
	<%}rs.close();%>
	</table>
	
	<form action="ShowItemInfo.jsp">
    	<input type="submit" value="Cancel" style="color:black;">
	</form>

    
</body>
	<%
        
            
    } catch (Exception E) {
            E.printStackTrace();
        }
    %> 

</html>