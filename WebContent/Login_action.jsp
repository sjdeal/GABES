<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="user" class="sjdeal.group.User" scope="session"/> 

<jsp:useBean id="customer" class="sjdeal.group.Customer" />

<jsp:setProperty name="user" property="*"/> 
<%       
    if(!user.login())
        response.sendRedirect("Login.html");
        //out.println("Imad Rahal");
    else{
    	ResultSet userRS = user.getUser();
    	userRS.next();
    	user.setUserId(userRS.getInt("userId"));
    	customer.setUserId(user.getUserId());
    	ResultSet rs = customer.getCustomer();
    	if(rs.next())
        	response.sendRedirect("menu.jsp");
    	else
    		response.sendRedirect("adminMenu.jsp");
    }
%> 


