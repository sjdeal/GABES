/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package group;
import java.io.*;
import java.sql.*;
/**
 *
 * @author irahal
 */
@SuppressWarnings("serial")
public class DatabaseBConnection implements Serializable {
        public static Connection openDBConnection() {
        try {
        	Class.forName("oracle.jdbc.OracleDriver");
        	Connection  myConnection = DriverManager.getConnection("jdbc:oracle:thin:@//cscioraclesrv.ad.csbsju.edu:1521/csci.cscioraclesrv.ad.csbsju.edu","jdbc", "jdbc");
            return myConnection;
        } catch (Exception E) {
            E.printStackTrace();
        }
        return null;
    }
}
