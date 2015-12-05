package Views;

import java.io.*;

import java.sql.*;

import  group.DatabaseBConnection;

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
	 
	 public ResultSet totalC(){
		 Connection mycon = DatabaseBConnection.openDBConnection();
		 try{
	        	String queryString = "SELECT SALES_REPORT_TOTAL_COMM AS TOTAL FROM DUAL";
	            PreparedStatement stmt = mycon.prepareStatement(queryString);
	            return stmt.executeQuery();
	        }
	        catch (Exception E) {
	            E.printStackTrace();
	            return null;
	        }
	 }
	 
	 public ResultSet totalP(){
		 Connection mycon = DatabaseBConnection.openDBConnection();
		 try{
	        	String queryString = "SELECT SALES_REPORT_TOTAL_PRICE AS TOTAL FROM DUAL";
	            PreparedStatement stmt = mycon.prepareStatement(queryString);
	            return stmt.executeQuery();
	        }
	        catch (Exception E) {
	            E.printStackTrace();
	            return null;
	        }
	 }
	 
	 public ResultSet subTotalPrice(){
		 Connection mycon = DatabaseBConnection.openDBConnection();
	        try{
	        	String queryString = "SELECT SALES_REPORT_SUBTOTAL_PRICE(?) AS SUBTOTAL FROM DUAL";
	            PreparedStatement stmt = mycon.prepareStatement(queryString);
	            stmt.clearParameters();
	            stmt.setString(1, this.category);
	            System.out.println(queryString);
	            return stmt.executeQuery();
//	            Statement stmt = mycon.createStatement();
//	            String queryString = "Select SALES_REPORT_SUBTOTAL_PRICE('"+this.getCategory()+"' ) AS SUBTOTAL from dual";
//	            System.out.println(queryString);
//	            return stmt.executeQuery(queryString);
	        }
	        catch (Exception E) {
	            E.printStackTrace();
	            return null;
	        }
	 }
	 
	 public ResultSet subTotalComm(){
		 Connection mycon = DatabaseBConnection.openDBConnection();
	        try{
	        	String queryString = "SELECT SALES_REPORT_SUBTOTAL_COMM(?) AS SUBTOTAL FROM DUAL";
	            PreparedStatement stmt = mycon.prepareStatement(queryString);
	            stmt.clearParameters();
	            stmt.setString(1, this.category);
	            return stmt.executeQuery();
//	            Statement stmt = mycon.createStatement();
//	            String queryString = "Select SALES_REPORT_SUBTOTAL_COMM('"+this.getCategory()+"') AS SUBTOTAL from dual";
//	            System.out.println(queryString);
//	            return stmt.executeQuery(queryString);
	        }
	        catch (Exception E) {
	            E.printStackTrace();
	            return null;
	        }
	 }


}
