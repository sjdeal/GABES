package group;

import java.io.*;
import java.sql.*;
import group.DatabaseBConnection;

public class Item implements Serializable {
  private Integer itemId;
  private Integer sellerId;
  private String itemName;
  private String category;
  private double startPrice;
  private String auctionStart;
  private String auctionEnd;
  private String description;
  
  private Short minRange;
  private Short maxRange;
  private ResultSet result;
  
  public double getMinRange() {
	return minRange;
  }
	
  
  public void setMinRange(Short minRange) {
	  this.minRange = minRange;
  }
	
	
  public Short getMaxRange() {
	  return maxRange;
  }
	
	
  public void setMaxRange(Short maxRange) {
	  this.maxRange = maxRange;
  }
	  
  public int getItemId() {
	  return this.itemId;
  }
  
  
  //public double getItemId() {
    //return itemId;
  //}
  
  public void setItemId(int itemId) {
    this.itemId = itemId;
  }
  
  public int getSellerId() {
    return sellerId;
  }
  
  public void setSellerId(int sellerId) {
    this.sellerId = sellerId;
  }
  
  public String getItemName() {
    return itemName;
  }
  
  public void setItemName(String itemName) {
    this.itemName = itemName;
  }
  
  public String getCategory() {
    return category;
  }
  
  public void setCategory(String category) {
    this.category = category;
  }
  
  public double getStartPrice() {
    return startPrice;
  }
  
  public void setStartPrice(double startPrice) {
    this.startPrice = startPrice;
  }
  
  public String getAuctionStart() {
    return auctionStart;
  }
  
  public void setAuctionStart(String auctionStart) {
    this.auctionStart = auctionStart;
  }
  
  public String getAuctionEnd() {
    return auctionEnd;
  }
  
  public void setAuctionEnd(String auctionEnd) {
    this.auctionEnd = auctionEnd;
  }
  
  public String getDescription() {
    return description;
  }
  
  public void setDescription(String description) {
    this.description = description;
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
  
  public ResultSet getItemInfo() throws IllegalStateException {
	try {
	    Connection con = openDBConnection();
	    Statement stmt = con.createStatement();
	    String queryString = "SELECT * FROM GABES_ITEM WHERE ITEMID = " + this.itemId;
	    ResultSet result = stmt.executeQuery(queryString);
	    return result;
	  }
	    
	  catch(SQLException se){}
	    
	  return result;
	  
  }
  
  public Item() {
  }
  
  public void addItem(){
      Connection mycon = DatabaseBConnection.openDBConnection();
      try{
    	  System.out.println(this.sellerId);
    	  System.out.println(this.itemName);
    	  System.out.println(this.category);
    	  System.out.println(this.startPrice);
    	  System.out.println(this.auctionStart);
    	  System.out.println(this.auctionEnd);
    	  System.out.println(this.description);
          String queryString = "{call team2.ADD_ITEM(?, ?, ?, ?, ?, ?, ?)}";
          CallableStatement stmt = mycon.prepareCall(queryString);
          stmt.clearParameters();
          stmt.setInt(1, this.sellerId);
          stmt.setString(2, this.itemName);
          stmt.setString(3, this.category);
          stmt.setDouble(4, this.startPrice);
          stmt.setString(5, this.auctionStart);
          stmt.setString(6, this.auctionEnd);
          stmt.setString(7, this.description);
          
          stmt.execute();
          stmt.close();
          mycon.close();
      }
      catch (Exception E) {
          E.printStackTrace();
      }
  }
  public ResultSet search(){
	  Connection con = DatabaseBConnection.openDBConnection();
	    ResultSet result = null;
//	    if(!this.loggedIn){
//	      throw new IllegalStateException("CAN'T GET DATA IF USER IS NOT LOGGED IN");
//	    }
	    try{
	    Statement st = con.createStatement();
	    String query = "Select * From GABES_ITEM WHERE 1=1";
	    if(this.itemId != null){
	    	query += " AND ITEMID = " + this.itemId;
	    }
	    if(this.description != (String) null){
	    	query += " AND (ITEMNAME LIKE '%" + this.description + "%' or DESCRIPTION LIKE '%" + this.description + "%')";
	    }
	    if(this.category != (String) null){
	    	query += " AND CATEGORY = '" + this.category + "'";
	    }
	    if(this.minRange != null){
	    	query += " AND GET_FINAL_PRICE(ITEMID) > " + this.minRange;
	    }
	    if(this.maxRange != null){
	    	query += " AND GET_FINAL_PRICE(ITEMID) < " + this.maxRange;
	    }
	    result = st.executeQuery(query);
	    }
	    catch(SQLException e){}
	    return result;
	  }
  
  public ResultSet currentBid(int id){
	  Connection con = DatabaseBConnection.openDBConnection();
	  ResultSet result = null;
	  try{
	      String queryString = "Select GET_FINAL_PRICE(?) AS FINAL FROM dual";
	      PreparedStatement preparedStmt = con.prepareStatement(queryString);
	      preparedStmt.clearParameters();
	      preparedStmt.setInt(1,id);
	      result = preparedStmt.executeQuery();
//	      if(result.next()){
//	    	  this.loggedIn = true;
//	      }
	  }
	  catch(SQLException e){}
	  return result;
  }
}
