<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="user" class="Login.User" scope="session"/> 
<jsp:setProperty name="user" property="*"/> 
<%       
    if(!user.login())
        response.sendRedirect("Login.html");
        //out.println("Imad Rahal");
    else
        response.sendRedirect("Menu.html");
%> 


