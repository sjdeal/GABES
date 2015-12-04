package group;

import java.io.*;

import java.sql.*;

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
  
  public boolean login() {
      Connection con = DatabaseBConnection.openDBConnection();
      try {
          ResultSet rs;
          Statement stmt;
          String queryString = "Select * from team2.GABES_USER where username='" + this.getUserName()
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
