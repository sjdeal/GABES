package group;

import java.io.*;
import java.sql.*;
import oracle.jdbc.*;
import group.DatabaseBConnection;

public class Customer implements Serializable {
  private int userId;
  private String fName;
  private String lName;
  private String email;
  private String phone;
  private int numItemsSold;
  private int sellerRating;
  
  public int getUserId() {
    return userId;
  }
  
  public void setUserId(int userId) {
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
  
  public int getNumItemsSold() {
    return numItemsSold;
  }
  
  public void setNumItemsSold(int numItemsSold) {
    this.numItemsSold = numItemsSold;
  }
  
  public int getSellerRating() {
    return sellerRating;
  }
  
  public void setSellerRating(int sellerRating){
	  this.sellerRating = sellerRating;
  }
  
  public Customer() {
  }
  
  public ResultSet getCustomer(){
      Connection mycon = DatabaseBConnection.openDBConnection();
      try{
          
          String queryString = "SELECT * FROM team2.GABES_CUSTOMER WHERE USERID=?";
          PreparedStatement stmt = mycon.prepareStatement(queryString);
          stmt.clearParameters();
          stmt.setInt(1, this.userId);
          return stmt.executeQuery();
      }
      catch (Exception E) {
          E.printStackTrace();
          return null;
      }
  }
  
  public void editCustomer(){
      Connection mycon = DatabaseBConnection.openDBConnection();
      try{
          
          String queryString = "update team2.GABES_CUSTOMER set " 
                  + "FNAME = ?, LNAME = ?, EMAIL = ?, PHONE = ?"
        		  + "WHERE USERID = ?";
          PreparedStatement stmt = mycon.prepareStatement(queryString);
          stmt.clearParameters();
          stmt.setString(1, this.fName);
          stmt.setString(2, this.lName);
          stmt.setString(3, this.email);
          stmt.setString(4, this.phone);
          stmt.setInt(5, this.userId);
          stmt.executeUpdate();
          System.out.println(stmt.toString());
          stmt.close();
          mycon.close();            
      } catch (Exception E) {
          E.printStackTrace();
      }
  }
  
}
