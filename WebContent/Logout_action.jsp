<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="user" class="group.User" scope="session"/> 
<%       
    user.logout();
	session.invalidate();
	response.sendRedirect("Login.html");
%> 