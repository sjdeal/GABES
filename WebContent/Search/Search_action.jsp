<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="user" class="group.User" scope="session"/>
<jsp:useBean id="item" class="group.Item" scope="request"/> 
<jsp:setProperty name="item" property="*"/> 

<%
RequestDispatcher dispatcher = request.getRequestDispatcher("../Results/Results.jsp");
dispatcher.forward(request, response);
%> 