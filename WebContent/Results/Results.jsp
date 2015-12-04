<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*, java.util.*"%>
<jsp:useBean id="item" class="group.Item" scope="request"/> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Results</title>
</head>
<table style="text-align: left; width: 100%;" border="1" cellpadding="2"
               cellspacing="2">
	<body>
		
                <tr>
                    <td style="vertical-align: top; text-align: left;">Item ID</td>
                    <td style="vertical-align: top; text-align: left;">Item Name</td>
                    <td style="vertical-align: top; text-align: left;">Category</td>
                    <td style="vertical-align: top; text-align: left;">Auction Start Time</td>
                    <td style="vertical-align: top; text-align: left;">Auction End Time</td>
                    <td style="vertical-align: top; text-align: left;">Current Bid</td>
                    <td style="vertical-align: top;"></td>
                    <td style="vertical-align: top;"></td>
                </tr>
                <%
                ResultSet rs = null;
                try{
                	rs = item.search();
                }
                catch(IllegalStateException ise){
                	out.println(ise.getMessage());
                	out.println("here");
                }
                while (rs.next()) {
                	String start = rs.getString("AUCTIONSTART");
                	start = start.split(" ")[0];
                	String end = rs.getString("AUCTIONEND");
                	end = end.split(" ")[0];
                %>
                <tr>
                    <td style="vertical-align: top; text-align: left;"><%=rs.getInt("ITEMID")%><br>
                    </td>
                    <td style="vertical-align: top; text-align: left;"><%=rs.getString("ITEMNAME")%><br>
                    </td>
                    <td style="vertical-align: top; text-align: left;"><%=rs.getString("CATEGORY")%><br>
                    </td>
                    <td style="vertical-align: top; text-align: left;"><%=start%><br>
                    </td>
                    <td style="vertical-align: top; text-align: left;"><%=end%><br>
                    </td>
                    <td style="vertical-align: top; text-align: left;">?????<br>
                    </td>
                    <td style="vertical-align: top; text-align: center;">
                        <form method="post" action="../Scotts/ShowItemInfo.jsp">
                            <input name="transNum" type="hidden" value ="<%=rs.getInt("ITEMID")%>">
                            <input value="View" type="submit"><br>
                        </form>
                    </td>
                    <td style="vertical-align: top; text-align: center;">
                        <form method="post" action="PlaceBid.jsp">
                            <input name="transNum" type="hidden" value ="<%=rs.getInt("ITEMID")%>">
                            <input value="View" type="submit"><br>
                        </form>
                    </td>
                </tr>
                <%      }
                        rs.close();
                %>
         	 
	</body>
</table>
	<form method="post" action="../Search/Search.jsp">  
	<input name="Submit" value="Back to search" type="submit"><br>
	</form>   
</html>