package sjdeal.group;

import java.io.*;
import java.sql.*;
import oracle.jdbc.*;

public class Bid implements Serializable {
  private double userId;
  private double itemId;
  private double maxBid;
  private String date;
  
  private ResultSet result;
  
  public double getUserId() {
    return userId;
  }
  
  public void setUserId(double userId) {
    this.userId = userId;
  }
  
  public double getItemId() {
    return itemId;
  }
  
  public void setItemId(double itemId) {
    this.itemId = itemId;
  }
  
  public double getMaxBid() {
    return maxBid;
  }
  
  public void setMaxBid(double maxBid) {
    this.maxBid = maxBid;
  }
  
  public String getDate() {
    return date;
  }
  
  public void setDate(String date) {
    this.date = date;
  }
  
  public ResultSet getBiddersList() throws IllegalStateException {
		try {
			Connection con = DatabaseBConnection.openDBConnection();
			String queryString = "SELECT * FROM LIST_BIDDERS WHERE ITEMID = ?";
	        PreparedStatement stmt = con.prepareStatement(queryString);
	        stmt.clearParameters();
	        stmt.setDouble(1, this.itemId);
	        ResultSet result = stmt.executeQuery();
		    return result;
		  }
		    
		  catch(SQLException se){}
		    
		  return result;
		  
	  }
  
  
  
	public ResultSet getFinalPrice() throws IllegalStateException {
		try {
		    Connection con = DatabaseBConnection.openDBConnection();
		    PreparedStatement stmt = con.prepareStatement("SELECT GET_FINAL_PRICE(?) FROM DUAL");
		    stmt.clearParameters();
		    stmt.setDouble(1, this.itemId);
		    ResultSet result = stmt.executeQuery();
		    return result;
		  }catch(SQLException se){}
		   
		  return result;
	  }

  public void Bid() {
	  Connection mycon = DatabaseBConnection.openDBConnection();
      try{
          
          String queryString = "update team2.GABES_BID set " 
                  + "USERID = ?, ITEMID = ?, MAXBID = ?, BIDDATE = ?";
          PreparedStatement stmt = mycon.prepareStatement(queryString);
          stmt.clearParameters();
          stmt.setDouble(1, this.userId);
          stmt.setDouble(2, this.itemId);
          stmt.setDouble(3, this.maxBid);
          stmt.setString(4, this.date);
          stmt.executeUpdate();
          stmt.close();
          mycon.close();            
      } catch (Exception E) {
          E.printStackTrace();
      }
  }
}
