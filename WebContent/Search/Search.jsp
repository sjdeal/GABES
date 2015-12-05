<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="user" class="group.User" scope="session"/>
<jsp:useBean id="item" class="group.Item" scope="session"/> 

<meta content="text/html; charset=ISO-8859-1"
http-equiv="content-type">
<title>Search</title>
</head>
<body>
	<form method="post" action="Search_action.jsp" name="SearchForm"> Item
		ID <input name="itemId"><br>
		Keyword <input name="description"><br>
		Category <select name="category">
			<option></option>
			<option>Clothing</option>
			<option>Electronics</option>
			<option>Books</option>
			<option>Body Parts</option>
			<option>Miscellaneous</option>
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