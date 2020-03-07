package utility;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import database.DBMS;

public class DbConnectUtil3 {
	//Member Variable
	public DBMS dbms = new DBMS();
	public Connection conn = null;
	public Statement stmt = null;
    public ResultSet rs = null;
    
	public Connection DbConnect () {
		try{
			conn = dbms.getConn();
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		} catch (SQLException e2) {
			e2.printStackTrace();
		}
		return conn;
	}
	
	public Statement DbStatement () {
		try{
			stmt = conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stmt;
	}
	
	public ResultSet DbQuery (String sql) {
		try{
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public void DbClose () {	
		try {
			if(rs != null) {rs.close();}
			if(stmt != null) {stmt.close();}
			if(conn != null) {conn.close();}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
