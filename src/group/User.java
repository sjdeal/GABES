package group;

import java.io.*;

import java.sql.*;

public class User implements Serializable {
  private int userId;
  private String userName;
  private String password;
  private boolean loggedIn = false;
  
  public ResultSet result;
  
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
  
  public boolean isLoggedIn(){
	  return this.loggedIn;
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
          PreparedStatement stmt = con.prepareStatement("Select * from team2.GABES_USER where username= ? and password = ?");
          stmt.clearParameters();
          stmt.setString(1, this.userName);
          stmt.setString(2, this.password);
          rs = stmt.executeQuery();

          
          if (rs.next()){
        	  loggedIn = true;
        	  stmt.close();
        	  con.close();
              return true;
          }
          else{
        	  stmt.close();
        	  con.close();
        	  return false;
          }
      } catch (Exception E) {
          E.printStackTrace();
          return false;
      }
  }
  
  public void logout(){
	  this.userId = 0;
	  this.userName = "";
	  this.password = "";
	  this.loggedIn = false;
  }

  public ResultSet getUser(){
      Connection mycon = DatabaseBConnection.openDBConnection();
      try{
          PreparedStatement stmt = mycon.prepareStatement("Select * from team2.GABES_USER where username= ? and password = ?");
          stmt.clearParameters();
          stmt.setString(1, this.userName);
          stmt.setString(2, this.password);
          return stmt.executeQuery();
      }
      catch (Exception E) {
          E.printStackTrace();
          return null;
      }
  }
  
  public ResultSet getUsersBids() throws IllegalStateException {
		try {
		    Connection con = DatabaseBConnection.openDBConnection();
		    PreparedStatement stmt = con.prepareStatement("select * from bidding_management_bid where userid = ?");
		    stmt.clearParameters();
		    stmt.setInt(1, this.userId);
		    ResultSet result = stmt.executeQuery();
		    return result;
		  }catch(SQLException se){}
		   
		  return result;
	  }

public ResultSet getUsersBought() throws IllegalStateException {
		try {
		    Connection con = DatabaseBConnection.openDBConnection();
		    PreparedStatement stmt = con.prepareStatement("SELECT * FROM BIDDING_MANAGEMENT_PURCHASED WHERE USERID = ?");
		    stmt.clearParameters();
		    stmt.setDouble(1, this.userId);
		    ResultSet result = stmt.executeQuery();
		    return result;
		  }catch(SQLException se){}
		   
		  return result;
	  }
}
