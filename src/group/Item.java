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
  
  public int getItemId() {
    return itemId;
  }
  
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
  
  public Item() {
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
	    	query += " AND (ITEMNAME LIKE '%" + this.description + "%' or DESCRIPTION LIKE '%" + this.description + "%'";
	    }
	    if(this.category != (String) null){
	    	query += " AND CATEGORY = " + this.category;
	    }
	    result = st.executeQuery(query);
	    }
	    catch(SQLException e){}
	    return result;
	  }
}
