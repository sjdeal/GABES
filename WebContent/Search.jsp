
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="item" class="group4.companyDB.Employee" scope="session"/> 
<html>
    <body>
        <a href="../Menu.html">back to menu</a><br>
        <%
            ResultSet rs = emp.getEmployee();
            if (!rs.next())
                response.sendRedirect("../Login.html");
            else {
        %>

            <br>
            <form method="post" action="Edit_action.jsp"><br>
                <table style="text-align: left; width: 100%;" border="1"
                       cellpadding="2" cellspacing="2">
                    <tbody>
                        <tr>
                            <td style="vertical-align: top;">SSN<br>
                            </td>
                            <td style="vertical-align: top;"><input readonly="readonly" name="ssn" 
                                                                    value="<%=rs.getString("ssn")%>"><br>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">First Name<br>
                            </td>
                            <td style="vertical-align: top;"><input name="fname"
                                                                    value="<%=rs.getString("fname")%>"> </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">Middle Initial<br>
                            </td>
                            <td style="vertical-align: top;"><input name="minit" value="<%=rs.getString("minit")%>"> </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">Last Name</td>
                            <td style="vertical-align: top;"><input name="lname" value="<%=rs.getString("lname")%>"> </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">Birth Date<br>
                            </td>
                            <td style="vertical-align: top;"><input readonly="readonly" name="bdate" value="<%=rs.getString("bdate")%>"> </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">Address<br>
                            </td>
                            <td style="vertical-align: top;"><input name="address" value="<%=rs.getString("address")%>"> </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">Sex<br>
                            </td>
                            <td style="vertical-align: top;"><input name="sex" value="<%=rs.getString("sex")%>"> </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">Salary<br>
                            </td>
                            <td style="vertical-align: top;"><input name="salary" value="<%=rs.getString("salary")%>"> </td>
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





