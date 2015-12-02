package group;

import java.io.*;
import java.sql.*;
import oracle.jdbc.*;

public class Item implements Serializable {
  private double itemId;
  private double sellerId;
  private String itemName;
  private String category;
  private double startPrice;
  private String auctionStart;
  private String auctionEnd;
  private String description;
  
  public double getItemId() {
    return itemId;
  }
  
  public void setItemId(double itemId) {
    this.itemId = itemId;
  }
  
  public double getSellerId() {
    return sellerId;
  }
  
  public void setSellerId(double sellerId) {
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
  
  public double getDescription() {
    return description;
  }
  
  public void setDescription(double description) {
    this.description = description;
  }
  
  public Item() {
  }
}
