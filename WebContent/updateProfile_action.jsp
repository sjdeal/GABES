<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="user" class="group.User" scope="session"/>
<jsp:useBean id="customer" class="group.Customer" /> 
<jsp:setProperty name="customer" property="*"/>
<% 
	customer.setFName((String)request.getAttribute("first"));
	customer.setLName((String)request.getAttribute("last"));
	System.out.println(customer.getFName());
	System.out.println(customer.getLName());
	System.out.println(customer.getEmail());
	System.out.println(customer.getPhone());
	customer.setUserId(user.getUserId());
	System.out.println(customer.getUserId());
    customer.editCustomer();
    String newPassword = (String)request.getAttribute("newPassword");
    String newPasswordAgain = (String)request.getAttribute("newPasswordAgain");
    if(!(newPassword==null) && newPassword.equals(newPasswordAgain)){
		user.setPassword(newPassword);
		user.updatePassword();
    }
    response.sendRedirect("updateProfile.jsp");
%>
