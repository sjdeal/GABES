<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="user" class="group.User" scope="session"/> 


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View My Feedback</title>
    </head>
    <body>

        <a href="../SellingManagement.jsp">back to menu</a><br>

        <table style="text-align: left; width: 100%;" border="1" cellpadding="2"
               cellspacing="2">
            <tbody>
                <tr>
                    <td style="vertical-align: top; text-align: center;">User ID</td>
                    <td style="vertical-align: top; text-align: center;">Item ID</td>
                    <td style="vertical-align: top; text-align: center;">Overall Satisfaction</td>
                    <td style="vertical-align: top; text-align: center;">Item Quality</td>
                    <td style="vertical-align: top; text-align: center;">Delivery</td>
                    <td style="vertical-align: top; text-align: center;">Comments</td>
                </tr>
                <%
                        ResultSet rs = user.getFeedbackForUser();
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
