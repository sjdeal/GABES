<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="user" class="sjdeal.group.User" scope="session"/>
<jsp:useBean id="item" class="sjdeal.group.Item"/> 
<jsp:useBean id="cust" class="sjdeal.group.Customer" />

<meta content="text/html; charset=ISO-8859-1"
http-equiv="content-type">
<title>Search</title>
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
	<form method="post" action="Search_action.jsp" name="SearchForm"> Item
		ID <input name="itemId"><br>
		Keyword <input name="description"><br>
		Category <select name="category">
			<option></option>
			<option>A Dare</option>
			<option>Body Parts</option>
			<option>Books</option>
			<option>Software</option>
			<option>SWAG</option>
			<option>Video</option>
			</select><br>
		Price Range <input name="minRange"> to <input name="maxRange"><br>
		<input name="Reset" value="Reset" type="reset">
		<input name="Submit" value="Search" type="submit"><br>
	</form>
	<form method="post" action="../menu.jsp">  
		<input name="Submit" value="Back" type="submit"><br>
	</form> 
<br>
<br>
</body>
</html>