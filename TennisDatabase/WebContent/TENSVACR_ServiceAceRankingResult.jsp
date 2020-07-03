<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="database.DBMS" %>
<%@ page import="utility.AccessCounter3" %>
<%@ page import="utility.DbConnectUtil3" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0" />
<link rel="stylesheet" type="text/css" href="css/CommonUtility.css">
<title>Ace Ranking</title>
	<img src="http://rainbow-engine.com/wp-content/uploads/2017/09/cropped-c8a03ed7.jpg" alt="" width="31%"/>
	<img src="http://rainbow-engine.com/wp-content/uploads/2017/09/cropped-c8a03ed7.jpg" alt="" width="31%"/>
	<img src="http://rainbow-engine.com/wp-content/uploads/2017/09/cropped-c8a03ed7.jpg" alt="" width="31%"/>
	<center>
		<h2 id="title">TENSVACR</h2>
		<h4 id="subtitle">Service Ace Ranking Result Screen</h4>
		
		<%
		AccessCounter3 ac = new AccessCounter3();
		%>
		[ アクセスカウンター： <b><%=ac.GetAccessCount2("TENSVACR")%></b> ]	
		<br />
	</center>
	<br />
	&#x1f3be;List tournament number for each surface type/年度別の各サーフェスのトーナメント数&#x1f3be;<br /><br />
</head>
<body>
<div style="height:400px; width:100%; overflow-y:scroll;" class="scroll-touch">
<table border="3" style="border-collapse: collapse" width="1650">
<tr>
	<th>Player Name</th>
	<th>Country</th>
	<th>(1)Total Aces<br />=(3)+(6)</th>
	<th>(2)Total<br />Matches</th>
	<th>(3)Aces in<br />Win Matches</th>
	<th>(4)Win<br />Matches</th>
	<th>(5)Aces per<br />Win Matches<br />=(3)/(4)</th>
	<th>(6)Aces in<br />Lose Matches</th>
	<th>(7)Lose<br />Matches</th>
	<th>(8)Aces per<br />Lose Matches<br />=(6)/(7)</th>
	<th>(9)Win Lose Gap<br />(Over 3 aces)<br />=(5)-(8)>3.0</th>
	<th>(10)Stats Info<br />Lacking Matches</th>
</tr>
<%
	String select1 = "SELECT NVL(WIN.WIN_NAME,LOSE.LOSE_NAME) AS PLAYER_NAME ,NVL(WIN.WIN_PLAYER_ID,LOSE.LOSE_PLAYER_ID) AS ID ,NVL(PO.FLAG_CODE,'-') AS COUNTRY ,NVL(WIN.WIN_ACES+LOSE.LOSE_ACES,0) AS T_ACES ,NVL(WIN.WIN_MATCH+LOSE.LOSE_MATCH,0) AS T_MATCHES ,NVL(WIN.WIN_ACES,0) AS W_ACES ,NVL(WIN.WIN_MATCH,0) AS W_MATCHES ,NVL(ROUND(WIN.WIN_ACES/WIN.WIN_MATCH,1),0.0) AS ACES_PERWIN ,NVL(LOSE.LOSE_ACES,0) AS L_ACES ,NVL(LOSE.LOSE_MATCH,0) AS L_MATCHES ,NVL(ROUND(LOSE.LOSE_ACES/LOSE.LOSE_MATCH,1),0.0) AS ACES_PERLOSE ,NVL(TNOSTATS.T_NOSTATS,0) AS T_NOSTATS ,CASE WHEN NVL(ROUND(WIN.WIN_ACES/WIN.WIN_MATCH,1),0.0)-NVL(ROUND(LOSE.LOSE_ACES/LOSE.LOSE_MATCH,1),0.0)>3.0 THEN 'GAP' ELSE '-' END AS WLGAP FROM ( SELECT SC.WIN_NAME,SC.WIN_PLAYER_ID,SUM(ST.WIN_ACES) AS WIN_ACES,COUNT(SC.WIN_PLAYER_ID) AS WIN_MATCH FROM  MATCH_SCORES SC ,MATCH_STATS ST WHERE SC.MATCH_ID = ST.MATCH_ID GROUP BY SC.WIN_PLAYER_ID, SC.WIN_NAME ) WIN FULL OUTER JOIN ( SELECT SC.LOSE_NAME,SC.LOSE_PLAYER_ID,SUM(ST.LOSE_ACES) AS LOSE_ACES,COUNT(SC.LOSE_PLAYER_ID) AS LOSE_MATCH  FROM  MATCH_SCORES SC ,MATCH_STATS ST WHERE SC.MATCH_ID = ST.MATCH_ID  GROUP BY SC.LOSE_PLAYER_ID, SC.LOSE_NAME ) LOSE ON WIN.WIN_PLAYER_ID = LOSE.LOSE_PLAYER_ID INNER JOIN PLAYER_OVERVIEWS PO ON PO.PLAYER_ID = NVL(WIN.WIN_PLAYER_ID,LOSE.LOSE_PLAYER_ID) INNER JOIN ( SELECT  NVL(WNOSTATS.WIN_NAME,LNOSTATS.LOSE_NAME) AS NAME ,NVL(WNOSTATS.WIN_PLAYER_ID,LNOSTATS.LOSE_PLAYER_ID) AS ID ,NVL(WNOSTATS.W_NOSTATS+LNOSTATS.L_NOSTATS,0) AS T_NOSTATS  FROM  ( SELECT WIN_NAME,WIN_PLAYER_ID,COUNT(*) AS W_NOSTATS FROM MATCH_SCORES SC WHERE SC.MATCH_STATS_URL_SUFFIX IS NULL GROUP BY WIN_NAME,WIN_PLAYER_ID ) WNOSTATS FULL OUTER JOIN ( SELECT LOSE_NAME,LOSE_PLAYER_ID,COUNT(*) AS L_NOSTATS FROM MATCH_SCORES SC WHERE SC.MATCH_STATS_URL_SUFFIX IS NULL GROUP BY LOSE_NAME,LOSE_PLAYER_ID ) LNOSTATS ON WNOSTATS.WIN_PLAYER_ID = LNOSTATS.LOSE_PLAYER_ID ) TNOSTATS ON TNOSTATS.ID = NVL(WIN.WIN_PLAYER_ID,LOSE.LOSE_PLAYER_ID) ORDER BY T_ACES DESC";
	DbConnectUtil3 db = new DbConnectUtil3();
	db.conn = db.DbConnect();
 	db.stmt = db.DbStatement();
	db.rs = db.DbQuery(select1);
	while(db.rs.next()){
		%>
		<tr>
			<td width="225"><%=db.rs.getString("PLAYER_NAME") %></td>
			<td width="75"><%=db.rs.getString("COUNTRY") %></td>
			<td width="150"><%=db.rs.getString("T_ACES") %> [Aces]</td>
			<td width="100"><%=db.rs.getString("T_MATCHES") %></td>
			<td width="150"><%=db.rs.getString("W_ACES") %> [Aces]</td>
			<td width="100"><%=db.rs.getString("W_MATCHES") %></td>
			<td width="150"><%=db.rs.getString("ACES_PERWIN") %></td>
			<td width="150"><%=db.rs.getString("L_ACES") %> [Aces]</td>
			<td width="100"><%=db.rs.getString("L_MATCHES") %></td>
			<td width="150"><%=db.rs.getString("ACES_PERLOSE") %></td>
			<td width="150"><%=db.rs.getString("WLGAP") %></td>
			<td width="150"><%=db.rs.getString("T_NOSTATS") %></td>
		</tr>
		<%
	}
	db.DbClose();%>
</table>
</div>
<a href="TENLDNPG_LandingPage.jsp">＞Go Back to <b>"TENLDNPG_LandingPage"</b> screen</a></br></br>
</body>
</html>