package group;

import java.io.*;
import java.sql.*;
import oracle.jdbc.*;

public class Bid implements Serializable {
  private double userId;
  private double itemId;
  private double maxBid;
  private String date;
  
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

  public Bid() {
  }
}
