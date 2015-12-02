package Views;

import java.io.*;
import java.sql.*;

import Login.DatabaseBConnection;

public class SalesSummaryReport {

	private String category;
	private int itemID;
	private String itemName;
	private double sellingPrice; 
	private double commission;

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getItemID() {
		return itemID;
	}

	public void setItemID(int itemID) {
		this.itemID = itemID;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public double getSellingPrice() {
		return sellingPrice;
	}

	public void setSellingPrice(double sellingPrice) {
		this.sellingPrice = sellingPrice;
	}
	
	public double getCommission() {
		return commission;
	}

	public void setCommission(double commission) {
		this.commission = commission;
	}
	/**
	 * A default constructor ... no need for other constructors
	 */
	 public SalesSummaryReport() {
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
	 
	 public ResultSet viewReport1(){
	        Connection mycon = DatabaseBConnection.openDBConnection();
	        try{
	            Statement stmt = mycon.createStatement();
	            String queryString = "Select * from team2.SALES_SUMMARY_REPORT";
	            return stmt.executeQuery(queryString);
	        }
	        catch (Exception E) {
	            E.printStackTrace();
	            return null;
	        }
	    }  
	 
	 public ResultSet totalSales(){
		 Connection mycon = DatabaseBConnection.openDBConnection();
	        try{
	            Statement stmt = mycon.createStatement();
	            String queryString = "SELECT SUM(SELLING_PRICE) AS TOTAL from SALES_SUMMARY_REPORT";
	            return stmt.executeQuery(queryString);
	        }
	        catch (Exception E) {
	            E.printStackTrace();
	            return null;
	        }
	 }
	 
	 public ResultSet subTotalSales(){
		 Connection mycon = DatabaseBConnection.openDBConnection();
	        try{
	            Statement stmt = mycon.createStatement();
	            String queryString = "Select * from team2.SALES_SUMMARY_REPORT";
	            return stmt.executeQuery(queryString);
	        }
	        catch (Exception E) {
	            E.printStackTrace();
	            return null;
	        }
	 }
	 /*public ResultSet viewReport1(){
		 Connection con = openDBConnection();
		    ResultSet result = null;
		    try{
		      String queryString = "Select * From  SALES_SUMMARY_REPORT;";
		      PreparedStatement preparedStmt; 
		      preparedStmt = con.prepareStatement(queryString);
//		      preparedStmt.clearParameters();
//		      preparedStmt.setString(1,this.username);
//		      preparedStmt.setString(2,this.pin);
//		      result = preparedStmt.executeQuery();
//		      if(result.next()){
//		          this.loggedIn = true;
//		        }
	            return preparedStmt.executeQuery(queryString);

		    }
		    catch(SQLException e){}
		    return null;
		    }*/


}
