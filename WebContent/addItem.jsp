
<%@page import="java.util.Calendar"%>
<%@ page language="java" import="java.sql.*"%>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Item</title>
        <jsp:useBean id="user" class="sjdeal.group.User" scope="session"/>
        <jsp:useBean id="cust" class="sjdeal.group.Customer" />
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
            <br>
            <form method="post" action="addItem_action.jsp"><br>
                <table style="text-align: left; width: 100%;" border="1"
                       cellpadding="2" cellspacing="2">
                    <tbody>
                        <tr>
                            <td style="vertical-align: top;">Item Name<br>
                            </td>
                            <td style="vertical-align: top;"><input name="itemName" 
                                                                    value=""><br>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">Category<br>
                            </td>
                            <td style="vertical-align: top;"><input name="category"
                                                                    value=""> </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">Start Price<br>
                            </td>
                            <td style="vertical-align: top;"><input name="startPrice" 
                                                                    value=""><br>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">Auction Start<br>
                            </td>
                            <td style="vertical-align: top;">
                            	<select name="startMonth">
                            		<option value="JAN">January</option>
                            		<option value="FEB">February</option>
                            		<option value="MAR">March</option>
                            		<option value="APR">April</option>
                            		<option value="MAY">May</option>
                            		<option value="JUN">June</option>
                            		<option value="JUL">July</option>
                            		<option value="AUG">August</option>
                            		<option value="SEP">September</option>
                            		<option value="OCT">October</option>
                            		<option value="NOV">November</option>
                            		<option value="DEC">December</option>
                            	</select>
                            	<select name="startDay">
                            		<% for(int i = 1; i <= 31; i++){ %>
                            			<option value="<%=i %>"><%=i %></option>
                            		<%} %>
                            	</select>
                            	<select name="startYear">
                            		<% for(int i = 2015; i <= 2020; i++){ %>
                            			<option value="<%=i %>"><%=i %></option>
                            		<%} %>
                            	</select>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">Auction End<br>
                            </td>
                            <td style="vertical-align: top;">
                            	<select name="endMonth">
                            		<option value="JAN">January</option>
                            		<option value="FEB">February</option>
                            		<option value="MAR">March</option>
                            		<option value="APR">April</option>
                            		<option value="MAY">May</option>
                            		<option value="JUN">June</option>
                            		<option value="JUL">July</option>
                            		<option value="AUG">August</option>
                            		<option value="SEP">September</option>
                            		<option value="OCT">October</option>
                            		<option value="NOV">November</option>
                            		<option value="DEC">December</option>
                            	</select>
                            	<select name="endDay">
                            		<% for(int i = 1; i <= 31; i++){ %>
                            			<option value="<%=i %>"><%=i %></option>
                            		<%} %>
                            	</select>
                            	<select name="endYear">
                            		<% for(int i = 2015; i <= 2020; i++){ %>
                            			<option value="<%=i %>"><%=i %></option>
                            		<%} %>
                            	</select>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">Description<br>
                            </td>
                            <td style="vertical-align: top;"><input name="description" 
                                                                    value=""><br>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <br>
                <input value="Add" type="submit">&nbsp; <input value="Reset"
                                                                type="reset"><br>
                <a href="SellingManagement.jsp">Cancel</a><br>                                               
                <br>
            </form>
        </body>
    </html>

</body>
</html>