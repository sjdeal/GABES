<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="user" class="sjdeal.group.User" scope="session"/>
<jsp:useBean id="bid" class="sjdeal.group.Bid"/> 
<jsp:setProperty name="bid" property="*"/> 

<%
bid.setUserId(Integer.parseInt(request.getParameter("userId")));
bid.setItemId(Integer.parseInt(request.getParameter("itemId")));
bid.setMaxBid(Integer.parseInt(request.getParameter("maxBid")));
bid.setDate((Integer.parseInt((String)request.getParameter("bidDay"))<=9 ? "0" : "") + 
		(String)request.getParameter("bidDay") + "-" +
		(String)request.getParameter("bidMonth") + "-" +
		(String)request.getParameter("bidYear"));
bid.Bid();
response.sendRedirect("../SellingManagement.jsp");
%> 