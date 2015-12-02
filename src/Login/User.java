package Login;

import java.io.*;
import java.sql.*;
/**
 *
 * @author amohr
 */
@SuppressWarnings("serial")
public class User implements Serializable {
	
	    private String username;
	    private String password;
	    
	    public User(){
	        
	    }
	  
	    
	    public boolean login() {
	        Connection con = DatabaseBConnection.openDBConnection();
	        try {
	            ResultSet rs;
	            Statement stmt;
	            String queryString = "Select * from Team2.GABES_USER where username='" + this.getUsername()
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
	            String queryString = "Select * from team2.GABES_USER where username='" + this.getUsername() + "' and "
	                    + " password ='"+this.getPassword()+"'";
	            return stmt.executeQuery(queryString);
	        }
	        catch (Exception E) {
	            E.printStackTrace();
	            return null;
	        }
	    }  
	    

	    /**
	     * @return the username
	     */
	    public String getUsername() {
	        return username;
	    }

	    /**
	     * @param username
	     */
	    public void setUsername(String username) {
	        this.username = username;
	    }

	    /**
	     * @return the password
	     */
	    public String getPassword() {
	        return password;
	    }

	    /**
	     * @param pin
	     */
	    public void setPassword(String password) {
	        this.password = password;
	    }

}
