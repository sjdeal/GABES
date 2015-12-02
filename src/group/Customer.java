package group;

import java.io.*;
import java.sql.*;
import oracle.jdbc.*;

public class Customer implements Serializable {
  private double userId;
  private String fName;
  private String lName;
  private String email;
  private String phone;
  private double numItemsSold;
  private double sellerRating;
  
  public double getUserId() {
    return userId;
  }
  
  public void setUserId(double userId) {
    this.userId = userId;
  }
  
  public String getFName() {
    return fName;
  }
  
  public void setFName(String fName) {
    this.fName = fName;
  }
  
  public String getLName() {
    return lName;
  }
  
  public void setLName(String lName) {
    this.lName = lName;
  }
  
  public String getEmail() {
    return email;
  }
  
  public void setEmail(String email) {
    this.email = email;
  }
  
  public String getPhone() {
    return phone;
  }
  
  public void setPhone(String phone) {
    this.phone = phone;
  }
  
  public double getNumItemsSold() {
    return numItemsSold;
  }
  
  public void setNumItemsSold(double numItemsSold) {
    this.numItemsSold = numItemsSold;
  }
  
  public double getSellerRating() {
    return sellerRating;
  }
  
  public Customer() {
  }
}
