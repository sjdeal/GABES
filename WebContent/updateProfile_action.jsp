<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="user" class="group.User" scope="session"/>
<jsp:useBean id="customer" class="group.Customer" /> 

<jsp:setProperty name="customer" property="*"/> 
<% 
	customer.setUserId(user.getUserId());
    customer.editCustomer();
    String newPassword = request.getAttribute("newPassword");
    String newPasswordAgain = request.getAttribute("newPasswordAgain");
    if(!newPassword.equals("") && newPassword.equals(newPasswordAgain)){
		user.setPassword(newPassword);
		user.updatePassword();
    }
    response.sendRedirect("updateProfile.jsp");
%>
