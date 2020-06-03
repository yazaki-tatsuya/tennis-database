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
<title>Insert title here</title>
	<img src="http://rainbow-engine.com/wp-content/uploads/2017/09/cropped-c8a03ed7.jpg" alt="" width="31%"/>
	<img src="http://rainbow-engine.com/wp-content/uploads/2017/09/cropped-c8a03ed7.jpg" alt="" width="31%"/>
	<img src="http://rainbow-engine.com/wp-content/uploads/2017/09/cropped-c8a03ed7.jpg" alt="" width="31%"/>
	<center>
		<h2 id="title">TENGSWIN</h2>
		<h4 id="subtitle">Grand Slam Win Times Ranking</h4>
		
		<%
		AccessCounter3 ac = new AccessCounter3();
		%>
		[ アクセスカウンター： <b>準備中</b> ]	
		<br />
	</center>
</head>
<body>
&#x1f3be;Ranking table of earned Grand Slam Titles/グランドスラム優勝回数のランキング&#x1f3be;<br /><br />
<div style="height:500px; width:100%; overflow-y:scroll;">
<table border="3" style="border-collapse: collapse" width="2500">
<tr>
	<th>Player Name</th>
	<th>Grand Slam<br />Win Total</th>
	<th>Australian Open<br />Win Total</th>
	<th>Australian Open<br />Win Year</th>
	<th>French Open<br />Win Total</th>
	<th>French Open<br />Win Year</th>
	<th>Wimbledon<br />Win Total</th>
	<th>Wimbledon<br />Win Year</th>
	<th>US Open<br />Win Total</th>
	<th>US Open<br />Win Year</th>
</tr>
<%
	String select1 = "SELECT NVL(NVL(NVL(AO.SINGLES_WIN_NAME,RG.SINGLES_WIN_NAME),WB.SINGLES_WIN_NAME),US.SINGLES_WIN_NAME) AS PLAYER_NAME ,(NVL(AO.AO_WINNUM,0)+NVL(RG.RG_WINNUM,0)+NVL(WB.WB_WINNUM,0)+NVL(US.US_WINNUM,0)) AS WIN_TOTAL ,NVL(AO.AO_WINNUM,0) AS AO_WIN ,NVL(AO.AO_WINYEAR,'-') AS AO_WINYEAR ,NVL(RG.RG_WINNUM,0) AS RG_WIN ,NVL(RG.RG_WINYEAR,'-') AS RG_WINYEAR ,NVL(WB.WB_WINNUM,0) AS WB_WIN ,NVL(WB.WB_WINYEAR,'-') AS WB_WINYEAR ,NVL(US.US_WINNUM,0) AS US_WIN ,NVL(US.US_WINYEAR,'-') AS US_WINYEAR FROM (SELECT SINGLES_WIN_NAME,SINGLES_WIN_PLAYER_ID,COUNT(SINGLES_WIN_PLAYER_ID) AS AO_WINNUM,LISTAGG(TOURNEY_YEAR,',') WITHIN GROUP (ORDER BY TOURNEY_YEAR) AS AO_WINYEAR FROM TOURNAMENTS_1877_2017 WHERE TOURNEY_SLUG = 'australian-open' GROUP BY SINGLES_WIN_PLAYER_ID, SINGLES_WIN_NAME) AO FULL OUTER JOIN (SELECT SINGLES_WIN_NAME,SINGLES_WIN_PLAYER_ID,COUNT(SINGLES_WIN_PLAYER_ID) AS RG_WINNUM,LISTAGG(TOURNEY_YEAR,',') WITHIN GROUP (ORDER BY TOURNEY_YEAR) AS RG_WINYEAR FROM TOURNAMENTS_1877_2017 WHERE TOURNEY_SLUG = 'roland-garros' GROUP BY SINGLES_WIN_PLAYER_ID, SINGLES_WIN_NAME) RG ON AO.SINGLES_WIN_PLAYER_ID = RG.SINGLES_WIN_PLAYER_ID FULL OUTER JOIN (SELECT SINGLES_WIN_NAME,SINGLES_WIN_PLAYER_ID,COUNT(SINGLES_WIN_PLAYER_ID) AS WB_WINNUM,LISTAGG(TOURNEY_YEAR,',') WITHIN GROUP (ORDER BY TOURNEY_YEAR) AS WB_WINYEAR FROM TOURNAMENTS_1877_2017 WHERE TOURNEY_SLUG = 'wimbledon' GROUP BY SINGLES_WIN_PLAYER_ID, SINGLES_WIN_NAME) WB ON NVL(AO.SINGLES_WIN_PLAYER_ID,RG.SINGLES_WIN_PLAYER_ID) = WB.SINGLES_WIN_PLAYER_ID FULL OUTER JOIN (SELECT SINGLES_WIN_NAME,SINGLES_WIN_PLAYER_ID,COUNT(SINGLES_WIN_PLAYER_ID) AS US_WINNUM,LISTAGG(TOURNEY_YEAR,',') WITHIN GROUP (ORDER BY TOURNEY_YEAR) AS US_WINYEAR FROM TOURNAMENTS_1877_2017 WHERE TOURNEY_SLUG = 'us-open' GROUP BY SINGLES_WIN_PLAYER_ID, SINGLES_WIN_NAME) US ON NVL(NVL(AO.SINGLES_WIN_PLAYER_ID,RG.SINGLES_WIN_PLAYER_ID),WB.SINGLES_WIN_PLAYER_ID) = US.SINGLES_WIN_PLAYER_ID ORDER BY WIN_TOTAL DESC,PLAYER_NAME";
	DbConnectUtil3 db = new DbConnectUtil3();
	db.conn = db.DbConnect();
	db.stmt = db.DbStatement();
	db.rs = db.DbQuery(select1);
	while(db.rs.next()){
		%>
		<tr>
			<td width="200"><%=db.rs.getString("PLAYER_NAME") %></td>
			<td width="150"><%=db.rs.getInt("WIN_TOTAL") %></td>
			<td width="150"><%=db.rs.getInt("AO_WIN") %></td>
			<td><%=db.rs.getString("AO_WINYEAR") %></td>
			<td width="150"><%=db.rs.getInt("RG_WIN") %></td>
			<td><%=db.rs.getString("RG_WINYEAR") %></td>
			<td width="150"><%=db.rs.getInt("WB_WIN") %></td>
			<td><%=db.rs.getString("WB_WINYEAR") %></td>
			<td width="150"><%=db.rs.getInt("US_WIN") %></td>
			<td><%=db.rs.getString("US_WINYEAR") %></td>
		</tr>
		<%
	}
	db.DbClose();%>
</table>
</div>
<a href="TENLDNPG_LandingPage.jsp">＞Go Back to <b>"TENLDNPG_LandingPage"</b> screen</a></br></br>
</body>
</html>