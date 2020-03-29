package tennisdb;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;

import utility.DbConnectUtil3;

public class TennisUtils {
	public ArrayList<String> getPlayerList(){
		//String select1 = "SELECT FIRST_NAME || ' ' || LAST_NAME AS PNAME FROM PLAYER_OVERVIEWS ORDER BY PNAME";
		String select1 = "SELECT FIRST_NAME || ' ' || LAST_NAME AS PNAME,PLAYER_SLUG FROM PLAYER_OVERVIEWS ORDER BY PLAYER_SLUG	";
		ArrayList<String> player = new ArrayList<String>(12000);
		DbConnectUtil3 db = new DbConnectUtil3();
		db.conn = db.DbConnect();
		db.stmt = db.DbStatement();
		db.rs = db.DbQuery(select1);
		Calendar cal3_1 = Calendar.getInstance();	 System.out.println(cal3_1.getTime()+" : 003_1-After execute player list SQL");
		int counter=0;
		try {
			while(db.rs.next()) {
				//時間測定の結果、このArrayListのadd処理に非常に時間を要している事がわかりました（未解決）
				player.add(counter,db.rs.getString("PNAME"));
				counter++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Calendar cal3_2 = Calendar.getInstance();	 System.out.println(cal3_2.getTime()+" : 003_2-After adding player to Array List");
		return player;
	}
}
