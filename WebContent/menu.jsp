<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:useBean id="user" class="sjdeal.group.User" scope="session"/>
<jsp:useBean id="cust" class="sjdeal.group.Customer" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./CSS/format.css">
<title>Customer Menu</title>
</head>
<body>

		<%
			if(!user.isLoggedIn())
				response.sendRedirect("Login.html");
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
        <a href="updateProfile.jsp">Update Profile</a><br>
        <br>      
        <br>
        <a href="SellingManagement.jsp">Selling Management</a><br>
        <br>
        <br>
        <a href="Search/Search.jsp">Search</a><br>
        <br>
        <br>
        <a href="Scotts/ListMyItems.jsp">List My Items</a><br>
        <br>
        <br>
        <a href="Logout_action.jsp">Logout</a>
</body>
</html>