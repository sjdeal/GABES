<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="user" class="sjdeal.group.User" scope="session"/>
<jsp:useBean id="cust" class="sjdeal.group.Customer" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View My Feedback</title>
        <link rel="stylesheet" type="text/css" href="./CSS/format.css">
    </head>
    <body>
    	<%
			if(!user.isLoggedIn())
				response.sendRedirect("Login.html");
			cust.setUserId(user.getUserId());
			ResultSet rs = cust.getCustomer();
			if(rs.next()){
				cust.setFName(rs.getString("fName"));
			}
		%>
		<div class="header-container">
			<div class="header">
			GABES
			</div>
			<div class="header2">
				Welcome, <%=cust.getFName() %>
			</div>
		</div>

        <table style="text-align: left; width: 100%;" border="1" cellpadding="2"
               cellspacing="2">
            <tbody>
                <tr class="first-row">
                    <td style="vertical-align: top; text-align: center;">User ID</td>
                    <td style="vertical-align: top; text-align: center;">Item ID</td>
                    <td style="vertical-align: top; text-align: center;">Overall Satisfaction</td>
                    <td style="vertical-align: top; text-align: center;">Item Quality</td>
                    <td style="vertical-align: top; text-align: center;">Delivery</td>
                    <td style="vertical-align: top; text-align: center;">Comments</td>
                </tr>
                <%
                        rs = user.getFeedbackForUser();
                        while (rs.next()) {
                %> 

                <tr>
                    <td style="vertical-align: top; text-align: center;"><%=rs.getString("USERID")%></td>
                    <td style="vertical-align: top; text-align: center;"><%=rs.getString("ITEMID")%></td>
                    <td style="vertical-align: top; text-align: center;"><%=rs.getString("OVERALLSATISFACTION")%></td>
                    <td style="vertical-align: top; text-align: center;"><%=rs.getString("ITEMQUALITY")%></td>
                    <td style="vertical-align: top; text-align: center;"><%=rs.getString("DELIVERY")%></td>
                    <td style="vertical-align: top; text-align: center;"><%=rs.getString("COMMENTS")%></td>
                </tr>
                <%      }
                        rs.close();
                %>

            </tbody>
        </table>
        
        <form action="SellingManagement.jsp" >
    		<input type="submit" value="Back" style="color:black;">
		</form>
    </body>
</html>
