package group;

import java.io.*;
import java.sql.*;
import oracle.jdbc.*;

public class User implements Serializable {
  private int userId;
  private String userName;
  private String password;
  
  public int getUserId() {
    return userId;
  }
  
  public void setUserId(int userId) {
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
  
  public void updatePassword(){
	  Connection mycon = DatabaseBConnection.openDBConnection();
      try{
          
          String queryString = "update team2.GABES_USER set " 
                  + "PASSWORD = ?"
        		  + "WHERE USERID = ?";
          PreparedStatement stmt = mycon.prepareStatement(queryString);
          stmt.clearParameters();
          stmt.setString(1, this.password);
          stmt.setInt(2, this.userId);
          stmt.executeUpdate(queryString);
          stmt.close();
          mycon.close();            
      } catch (Exception E) {
          E.printStackTrace();
      }
  }
  
  public ResultSet getFeedbackForUser(){
      Connection mycon = DatabaseBConnection.openDBConnection();
      try{
          
          String queryString = "SELECT USERID, ITEMID, OVERALLSATISFACTION, " +
        		  "ITEMQUALITY, DELIVERY, COMMENTS " +
        		  "FROM team2.VIEW_MY_FEEDBACK WHERE SELLERID=?";
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
  
  public User() {
  }
  
}
