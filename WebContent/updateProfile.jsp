
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="user" class="group.User" scope="session"/>
<jsp:useBean id="customer" class="group.Customer" /> 
<html>
    <body>
        <a href="../menu.jsp">back to menu</a><br>
        <%
        	customer.setUserId(user.getUserId());
            ResultSet rs = customer.getCustomer();
            if (!rs.next())
                response.sendRedirect("Login.html");
            else {
        %>

            <br>
            <form method="post" action="updateProfile_action.jsp"><br>
                <table style="text-align: left; width: 100%;" border="1"
                       cellpadding="2" cellspacing="2">
                    <tbody>
                        <tr>
                            <td style="vertical-align: top;">Username<br>
                            </td>
                            <td style="vertical-align: top;"><input readonly="readonly" name="userName" 
                                                                    value="<%=user.getUserName() %>"><br>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">First Name</td>
                            <td style="vertical-align: top;"><input name="first" value="<%=rs.getString("fName")%>"> </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">Last Name</td>
                            <td style="vertical-align: top;"><input name="last" value="<%=rs.getString("lName")%>"> </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">Email</td>
                            <td style="vertical-align: top;"><input name="email" value="<%=rs.getString("email")%>"> </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">Phone</td>
                            <td style="vertical-align: top;"><input name="phone" value="<%=rs.getString("phone")%>"> </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">Seller Rating</td>
                            <td style="vertical-align: top;"><%=rs.getInt("sellerRating") %> </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">Number of Seller Ratings</td>
                            <td style="vertical-align: top;"><%=rs.getInt("numItemsSold") %> </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">New Password</td>
                            <td style="vertical-align: top;"><input name="newPassword" type="password" value=""> </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">Retype New Password</td>
                            <td style="vertical-align: top;"><input name="newPasswordAgain" type="password" value=""> </td>
                        </tr>
                    </tbody>
                </table>
                <br>
                <input value="Edit" type="submit">&nbsp; <input value="Reset"
                                                                type="reset"><br>
                <br>
            </form>
        </body>
    </html>
    <%
        rs.close();}
    %> 
</body>
</html>





