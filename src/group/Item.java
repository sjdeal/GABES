package group;

import java.io.*;
import java.sql.*;
import oracle.jdbc.*;
import group.DatabaseBConnection;

public class Item implements Serializable {
  private int itemId;
  private int sellerId;
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
}
