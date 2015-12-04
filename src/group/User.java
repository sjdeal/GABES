package group;

import java.io.*;

import java.sql.*;

import Login.DatabaseBConnection;


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
  
  public boolean login() {
      Connection con = DatabaseBConnection.openDBConnection();
      try {
          ResultSet rs;
          Statement stmt;
          String queryString = "Select * from Team2.GABES_USER where username='" + this.getUserName()
                              + "' and password = '" + this.getPassword() + "'";

          stmt = con.createStatement();
          rs = stmt.executeQuery(queryString);

          
          if (rs.next())
              return true;
          else 
              return false;
      } catch (Exception E) {
          E.printStackTrace();
          return false;
      }
  }

  public ResultSet getUser(){
      Connection mycon = DatabaseBConnection.openDBConnection();
      try{
          Statement stmt = mycon.createStatement();
          String queryString = "Select * from team2.GABES_USER where username='" + this.getUserName() + "' and "
                  + " password ='"+this.getPassword()+"'";
          return stmt.executeQuery(queryString);
      }
      catch (Exception E) {
          E.printStackTrace();
          return null;
      }
  }  
}
