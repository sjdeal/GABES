<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>List Of Bidders</title>
</head>
<body>
	<%@ page language="java" import="java.sql.*" %>
	<jsp:useBean id="bid" class="group.Bid" scope="session"/>
	<jsp:useBean id="customer" class="group.Customer" scope="session"/>

	<h1>List Of Bidders</h1>
<%
		
    try {
    	ResultSet rs = bid.getBiddersList(); 
    	if(rs.next()) {
    %>

	<!-- <form method="post" action="ShowItemInfo_Action" name="EditForm"> -->
	<table>
	<tr>
		<td> ITEM ID: <input readonly="readonly" name="ItemID" value="<%=rs.getInt("ITEMID")%>"> </td>
	</tr>
	<tr>
		<td> <input readonly="readonly" name="AuctionStart" value="<%=rs.getDate("AUCTIONSTART")%>">
		-<input readonly="readonly" name="AuctionEnd" value="<%=rs.getDate("AUCTIONEND")%>"> </td>
	</tr>
	</table>
	
	<% }rs = bid.getBiddersList(); 
    	while (rs.next()) { %>
	
	<table>
	<tr>
	<td> Bidding Time:</td>
	<td> USER NAME:</td>
	<td> Bidding Price</td>
	</tr>
	
	<tr>
	<td> <input readonly="readonly" name="BidDate" value="<%=rs.getDate("BidDate")%>">  </td>
	<td> <input readonly="readonly" name="UserName" value="<%=rs.getString("USERNAME")%>">  </td>
	<td>  <input readonly="readonly" name="MaxBid" value="<%=rs.getString("MAXBID")%>">   </td>
	</tr>
	
	</table>
    
     
   
    

</body>
	<%
        }rs.close();
            
    } catch (Exception E) {
            E.printStackTrace();
        }
    %> 

</html>