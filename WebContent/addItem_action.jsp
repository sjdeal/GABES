<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="user" class="group.User" scope="session"/> 
<jsp:useBean id="item" class="group.Item"/> 
<jsp:setProperty name="item" property="*"/>
<%
    item.setSellerId(user.getUserId());
	item.setAuctionStart((Integer.parseInt((String)request.getParameter("startDay"))<=9 ? "0" : "") + 
			(String)request.getParameter("startDay") + "-" +
			(String)request.getParameter("startMonth") + "-" +
			(String)request.getParameter("startYear"));
	item.setAuctionEnd((Integer.parseInt((String)request.getParameter("endDay"))<=9 ? "0" : "") + 
			(String)request.getParameter("endDay") + "-" +
			(String)request.getParameter("endMonth") + "-" +
			(String)request.getParameter("endYear"));
    item.addItem();
    response.sendRedirect("SellingManagement.jsp");
%>
