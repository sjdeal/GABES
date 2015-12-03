package group;

import java.io.*;

import java.sql.*;
import oracle.jdbc.*;

public class User implements Serializable {
  private double userId;
  private String userName;
  private String password;
  
  public double getUserId() {
    return userId;
  }
  
  public void setUserId(double userId) {
    this.userId = userId;
  }
  
  public String getUserName() {
    return userName;
  }
  
  public void setUserName(String userName) {
    this.userName = userName;
  }
  
  public String getPassword() {
    return password;
  }
  
  public void setPassword(String password) {
    this.password = password;
  }
  
  public User() {
  }
}
