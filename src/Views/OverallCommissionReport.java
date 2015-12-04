package Views;

import java.io.*;

import java.sql.*;

import group.DatabaseBConnection;

public class OverallCommissionReport {

	private int userID;
	private String username;
	private String fname;
	private String lname; 
	private String email;
	private int sellerRating;
	private double commissions;

	
	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getSellerRating() {
		return sellerRating;
	}

	public void setSellerRating(int sellerRating) {
		this.sellerRating = sellerRating;
	}

	public double getCommissions() {
		return commissions;
	}

	public void setCommissions(double commissions) {
		this.commissions = commissions;
	}

	/**
	 * A default constructor ... no need for other constructors
	 */
	 public OverallCommissionReport() {
	 }

	 /**
	  * This method and creates and returns a Connection object to the database. 
	  * All other methods that need database access should call this method.
	  * @return a Connection object to Oracle
	  */
	 public Connection openDBConnection() {
		 try {
			 // Load driver and link to driver manager
			 Class.forName("oracle.jdbc.OracleDriver");
			 // Create a connection to the specified database
			 Connection myConnection = DriverManager.getConnection("jdbc:oracle:thin:@//cscioraclesrv.ad.csbsju.edu:1521/" +
					 "csci.cscioraclesrv.ad.csbsju.edu","Team2", "dhhm4");
			 return myConnection;
		 } catch (Exception E) {
			 E.printStackTrace();
		 }
		 return null;
	 }
	 
	 public ResultSet viewReport2(){
	        Connection mycon = DatabaseBConnection.openDBConnection();
	        try{
	            Statement stmt = mycon.createStatement();
	            String queryString = "Select * from team2.Overall_Commission_Report";
	            return stmt.executeQuery(queryString);
	        }
	        catch (Exception E) {
	            E.printStackTrace();
	            return null;
	        }
	    }  



}
