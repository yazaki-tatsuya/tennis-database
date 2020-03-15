package utility;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AccessCounter3 {
	public int GetAccessCount2(String function) throws SQLException {
		int access_count=0;
		DbConnectUtil3 db = new DbConnectUtil3();
		String sql_sel = "SELECT * FROM ACCESS_COUNTER WHERE FUNCTION_ID='"+function+"'";
		String sql_upd ="";
		
		db.conn = db.DbConnect();
		db.stmt = db.DbStatement();
		db.rs = db.DbQuery(sql_sel);
		try {
			while(db.rs.next()) {
				sql_upd = "UPDATE ACCESS_COUNTER SET ACCESS_COUNT="+(db.rs.getInt("ACCESS_COUNT")+1)+" "+
						  "WHERE COUNTER_ID='"+db.rs.getString("COUNTER_ID")+"'";	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.rs.close();
		db.rs = db.DbQuery(sql_upd);
		db.rs.close();
		db.rs = db.DbQuery(sql_sel);
		try {
			while(db.rs.next()) {
				access_count = db.rs.getInt("ACCESS_COUNT");
				//System.out.println("accesscount="+access_count+" getInt-ACCESS_COUNT="+db.rs.getInt("ACCESS_COUNT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		db.DbClose();
		return access_count;
	}
}
