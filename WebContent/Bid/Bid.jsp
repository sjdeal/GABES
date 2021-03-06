<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="java.util.*"%>
<jsp:useBean id="user" class="sjdeal.group.User" scope="session"/>
<jsp:useBean id="bid" class="sjdeal.group.Bid"/> 
<jsp:useBean id="cust" class="sjdeal.group.Customer"/>

<meta content="text/html; charset=ISO-8859-1"
http-equiv="content-type">
<title>Bid</title>
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
		
<h1>Item <%= request.getParameter("itemID") %></h1>
	<form method="post" action="Bid_action.jsp" name="BidForm"> Item
		UserID <input readonly="readonly" name="userId" value="<%=user.getUserId() %>"><br>
		Item ID <input readonly="readonly" name="itemId" value="<%= request.getParameter("itemID") %>"><br>
		Max Bid <input name="maxBid"><br>
		Date <select name="bidMonth">
                            		<option value="JAN">January</option>
                            		<option value="FEB">February</option>
                            		<option value="MAR">March</option>
                            		<option value="APR">April</option>
                            		<option value="MAY">May</option>
                            		<option value="JUN">June</option>
                            		<option value="JUL">July</option>
                            		<option value="AUG">August</option>
                            		<option value="SEP">September</option>
                            		<option value="OCT">October</option>
                            		<option value="NOV">November</option>
                            		<option value="DEC">December</option>
                            	</select>
                            	<select name="bidDay">
                            		<% for(int i = 1; i <= 31; i++){ %>
                            			<option value="<%=i %>"><%=i %></option>
                            		<%} %>
                            	</select>
                            	<select name="bidYear">
                            		<% for(int i = 2015; i <= 2020; i++){ %>
                            			<option value="<%=i %>"><%=i %></option>
                            		<%} %>
                            	</select><br>
		<input name="Reset" value="Reset" type="reset">
		<input name="Submit" value="Submit" type="submit"><br>
	</form>
	<form method="post" action="../menu.jsp">  
		<input name="Submit" value="Back" type="submit"><br>
	</form> 
<br>
<br>

</body>
</html>