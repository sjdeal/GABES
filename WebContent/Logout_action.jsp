<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="user" class="sjdeal.group.User" scope="session"/> 
<%       
    user.logout();
	session.invalidate();
	response.sendRedirect("Login.html");
%> 