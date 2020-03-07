package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class DBMS {

	// DB Connection Info	
	private final String host = "jdbc:oracle:thin:@tk2-262-40837.vs.sakura.ne.jp:1521:ORCL";
	private final String user = "TENNISDBUSR";
	private final String pass = "Tatsuya0813$";
	
	/**
	 * Connect with DB
	 * @return DB Connection
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public Connection getConn() throws ClassNotFoundException, SQLException {

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		return conn;
	}

	/**
	 * End the DB connection
	 * @param conn DB connection
	 */
	public void close(Connection conn) {
		try {
			if(conn != null) {
				conn.close();
				System.out.println("Ended DB connection");
			}

		} catch (SQLException e) {
			// TODO Auto generated catch block
			e.printStackTrace();
		}
	}	
}
