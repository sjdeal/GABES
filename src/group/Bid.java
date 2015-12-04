package group;

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
  
  public Connection openDBConnection() {
	    try {
	      // Load driver and link to driver manager
	      Class.forName("oracle.jdbc.OracleDriver");
	      // Create a connection to the specified database
	      Connection myConnection = DriverManager.getConnection("jdbc:oracle:thin:@//cscioraclesrv.ad.csbsju.edu:1521/" +
                                                          "csci.cscioraclesrv.ad.csbsju.edu","team2", "dhhm4");
	      return myConnection;
	    } catch (Exception E) {
	      E.printStackTrace();
	    }
	    return null;
	  }
  
  public ResultSet getBiddersList() throws IllegalStateException {
		try {
		    Connection con = openDBConnection();
		    Statement stmt = con.createStatement();
		    String queryString = "SELECT * FROM LIST_BIDDERS WHERE ITEMID = 2";
		    ResultSet result = stmt.executeQuery(queryString);
		    return result;
		  }
		    
		  catch(SQLException se){}
		    
		  return result;
		  
	  }
  
  public ResultSet getUsersBids() throws IllegalStateException {
		try {
		    Connection con = openDBConnection();
		    Statement stmt = con.createStatement();
		    String queryString = "SELECT * FROM BIDDING_MANAGEMENT_BID WHERE USERID = 3";
		    ResultSet result = stmt.executeQuery(queryString);
		    return result;
		  }catch(SQLException se){}
		   
		  return result;
	  }
  
  public ResultSet getUsersBought() throws IllegalStateException {
		try {
		    Connection con = openDBConnection();
		    Statement stmt = con.createStatement();
		    String queryString = "SELECT * FROM BIDDING_MANAGEMENT_PURCHASED WHERE USERID = 3";
		    ResultSet result = stmt.executeQuery(queryString);
		    return result;
		  }catch(SQLException se){}
		   
		  return result;
	  }
  
  public ResultSet getFinalPrice() throws IllegalStateException {
		try {
		    Connection con = openDBConnection();
		    Statement stmt = con.createStatement();
		    String queryString = "SELECT GET_FINAL_PRICE(3) FROM DUAL";
		    ResultSet result = stmt.executeQuery(queryString);
		    return result;
		  }catch(SQLException se){}
		   
		  return result;
	  }

  public Bid() {
  }
}
