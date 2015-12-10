<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="user" class="sjdeal.group.User" scope="session"/>
<jsp:useBean id="item" class="sjdeal.group.Item" scope="request"/> 
<jsp:setProperty name="item" property="*"/> 

<%
if(request.getParameter("minRange") != ""){
	item.setMinRange(Short.parseShort(request.getParameter("minRange")));
}
RequestDispatcher dispatcher = request.getRequestDispatcher("../Results/Results.jsp");
dispatcher.forward(request, response);
%> 