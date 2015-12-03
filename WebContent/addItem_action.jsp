<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="user" class="group.User" scope="session"/> 
<jsp:useBean id="item" class="group.Item"/> 
<jsp:setProperty name="item" property="*"/>
<%
    item.setSellerId(user.getUserId());
	item.setAuctionStart((request.getAttribute("startDay")<=9 : "0" ? "") + 
			request.getAttribute("startDay") + "-" +
			request.getAttribute("startMonth") + "-" +
			request.getAttribute("startYear"));
	item.setAuctionEnd((request.getAttribute("endDay")<=9 : "0" ? "") + 
			request.getAttribute("endDay") + "-" +
			request.getAttribute("endMonth") + "-" +
			request.getAttribute("endYear"));
    item.addItem();
    response.sendRedirect("SellingManagement.jsp");
%>
