<!DOCTYPE html>
<html>
    <head>
        <title>Admin Menu</title>
        <jsp:useBean id="user" class="group.User" scope="session"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="./CSS/format.css">
    </head>
    <body>
    <%
		if(!user.isLoggedIn())
			response.sendRedirect("Login.html");
	%>  
		<div class="header-container">
			<div class="header">
			GABES
			</div>
			<div class="header2">
				Welcome, Admin
			</div>
		</div>
	
	    <h1>Admin Menu</h1>
        <br>
        <a href="SalesSummaryReport.jsp">View sales summary report</a><br>
        <br>
        <br>
        <a href="OverallCommissionReport.jsp">View overall commission report</a><br>
        <br>
        <br>
        <a href="Logout_action.jsp">Logout</a>
    </body>
</html>
