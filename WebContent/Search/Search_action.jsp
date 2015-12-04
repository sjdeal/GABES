<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="user" class="group.User" scope="session"/>
<jsp:useBean id="item" class="group.Item" scope="session"/> 
<jsp:setProperty name="item" property="*"/> 

<%
response.sendRedirect("../Results/Results.jsp");
%> 