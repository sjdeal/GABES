package sjdeal.group;

import java.io.*;
import java.sql.*;
import oracle.jdbc.*;

public class Sold implements Serializable {
  private double userId;
  private double itemId;
  private double sellingPrice;
  
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
  
  public double getSellingPrice() {
    return sellingPrice;
  }
  
  public void setSellingPrice(double sellingPrice) {
    this.sellingPrice = sellingPrice;
  }
 
  public Sold() {
  }
}
