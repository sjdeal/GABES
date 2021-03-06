<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*, java.util.*"%>
<jsp:useBean id="item" class="sjdeal.group.Item" scope="request"/> 
<jsp:useBean id="user" class="sjdeal.group.User" scope="session"/>
<jsp:useBean id="cust" class="sjdeal.group.Customer" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Results</title>
<link rel="stylesheet" type="text/css" href="../CSS/format.css">
</head>
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
		<br>
		<table style="text-align: left; width: 100%;" border="1" cellpadding="2"
               cellspacing="2">
		
                <%
                rs = null;
                try{
                	rs = item.search();
                }
                catch(IllegalStateException ise){
                	out.println(ise.getMessage());
                }
                if(!rs.next()){
                	%>
                	<h5>No results found</h5>
                	<%
                }
                else{
                	try{
                    	rs = item.search();
                    }
                    catch(IllegalStateException ise){
                    	out.println(ise.getMessage());
                    }
           		 	%>
	                <tr class="first-row">
	                    <td style="vertical-align: top; text-align: left;">Item ID</td>
	                    <td style="vertical-align: top; text-align: left;">Item Name</td>
	                    <td style="vertical-align: top; text-align: left;">Category</td>
	                    <td style="vertical-align: top; text-align: left;">Auction Start Date</td>
	                    <td style="vertical-align: top; text-align: left;">Auction End Date</td>
	                    <td style="vertical-align: top; text-align: left;">Current Bid</td>
	                    <td style="vertical-align: top;"></td>
	                    <td style="vertical-align: top;"></td>
	                </tr>
                	<%
                	
	                while (rs.next()) {
	                	String start = rs.getString("AUCTIONSTART");
	                	start = start.split(" ")[0];
	                	String end = rs.getString("AUCTIONEND");
	                	end = end.split(" ")[0];
	                %>
	                <tr>
	                    <td style="vertical-align: top; text-align: right;"><%=rs.getInt("ITEMID")%><br>
	                    </td>
	                    <td style="vertical-align: top; text-align: left;"><%=rs.getString("ITEMNAME")%><br>
	                    </td>
	                    <td style="vertical-align: top; text-align: left;"><%=rs.getString("CATEGORY")%><br>
	                    </td>
	                    <td style="vertical-align: top; text-align: left;"><%=start%><br>
	                    </td>
	                    <td style="vertical-align: top; text-align: left;"><%=end%><br>
	                    </td>
	                    <%
	                    ResultSet price = null;
	                    String Price = "";
	                    try{
	                    	price = item.currentBid(rs.getInt("ITEMID"));
	                    }
	                    catch(IllegalStateException ise){
	                    	out.println(ise.getMessage());
	                    }
	                    if(price.next()){
	                    	Price = String.format("%.2f", price.getDouble("FINAL"));
	                    }
	                    
	                    %>
	                    <td style="vertical-align: top; text-align: right;">$<%=Price%><br>
	                    </td>
	                    <td style="vertical-align: top; text-align: center;">
	                        <form method="post" action="../Scotts/ShowItemInfo.jsp">
	                            <input name="transNum" type="hidden" value ="<%=rs.getInt("ITEMID")%>">
	                            <input value="Info" type="submit"><br>
	                        </form>
	                    </td>
	                    <td style="vertical-align: top; text-align: center;">
	                        <form method="post" action="../Bid/Bid.jsp">
	                            <input name="itemID" type="hidden" value ="<%=rs.getInt("ITEMID")%>">
	                            <input value="Bid" type="submit"><br>
	                        </form>
	                    </td>
	                </tr>
	                <%      
	                }
                 	rs.close();
                }
                %>
         	 
	
</table>

	<form method="post" action="../Search/Search.jsp">  
	<input name="Submit" value="Back to search" type="submit"><br>
	</form>   
</body>
</html>