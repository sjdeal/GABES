<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>List Of Bidders</title>
</head>
<body>
	<%@ page language="java" import="java.sql.*" %>
	<jsp:useBean id="bid" class="group.Bid" scope="session"/>

	<h1>List Of Bidders</h1>
<%
		
    try {
    	ResultSet rs = bid.getBiddersList(); 
    	if(rs.next()) {
    %>

	<!-- <form method="post" action="ShowItemInfo_Action" name="EditForm"> -->
	<table>
	<tr>
		<td> ITEM ID: <%=rs.getInt("ITEMID")%> </td>
	</tr>
	<tr>
		<td> <%=rs.getDate("AUCTIONSTART")%> - <%=rs.getDate("AUCTIONEND")%> </td>
	</tr>
	</table>	
	
	
	<div>
	
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
	
	</div>
    
     
   
    

</body>
	<%
        
            
    } catch (Exception E) {
            E.printStackTrace();
        }
    %> 

</html>