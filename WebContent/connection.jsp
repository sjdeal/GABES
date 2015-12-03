<%@ page language="java" import="java.sql.*"%>
<%

Class.forName("oracle.jdbc.OracleDriver");
Connection  myConnection = DriverManager.getConnection("jdbc:oracle:team2@//cscioraclesrv.ad.csbsju.edu:1521/csci.cscioraclesrv.ad.csbsju.edu","team2", "dhhm4");
%>