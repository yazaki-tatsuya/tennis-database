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
		<h2 id="title">TENSURCN</h2>
		<h4 id="subtitle">Court Surface Type Count Screen</h4>
		
		<%
		AccessCounter3 ac = new AccessCounter3();
		%>
		[ アクセスカウンター： <b>準備中</b> ]	
		<br />
	</center>
	<br />
	&#x1f3be;List tournament number for each surface type/年度別の各サーフェスのトーナメント数&#x1f3be;<br /><br />
</head>
<body>
<div style="height:500px; width:100%; overflow-y:scroll;" class="scroll-touch">
<table border="3" style="border-collapse: collapse" width="1700">
<tr>
	<th>Year</th>
	<th>All Surface<br />Total</th>
	<th>Clay<br />Total</th>
	<th>Clay Surface<br />Tournament Names</th>
	<th>Hard<br />Total</th>
	<th>Hard Surface<br />Tournament Names</th>
	<th>Grass<br />Total</th>
	<th>Grass Surface<br />Tournament Names</th>
	<th>Carpet<br />Total</th>
	<th>Carpet Surface<br />Tournament Names</th>
</tr>
<%
	String select1 = "SELECT NVL(NVL(NVL(CLAY.TOURNEY_YEAR,HARD.TOURNEY_YEAR),GRASS.TOURNEY_YEAR),CARPET.TOURNEY_YEAR) AS YEAR ,(NVL(CLAY_NUM,0)+NVL(HARD_NUM,0)+NVL(GRASS_NUM,0)+NVL(CARPET_NUM,0)) AS TOTAL_TOURNEY ,NVL(CLAY_NUM,0) AS CLAY_NUM ,NVL(CLAY_NAME,'-') AS CLAY_NAME ,NVL(HARD_NUM,0) AS HARD_NUM ,NVL(HARD_NAME,'-') AS HARD_NAME ,NVL(GRASS_NUM,0) AS GRASS_NUM ,NVL(GRASS_NAME,'-') AS GRASS_NAME ,NVL(CARPET_NUM,0) AS CARPET_NUM ,NVL(CARPET_NAME,'-') AS CARPET_NAME FROM (SELECT TOURNEY_YEAR, COUNT(TOURNEY_ID) AS CLAY_NUM, LISTAGG('# '||TOURNEY_NAME,'<br />') WITHIN GROUP (ORDER BY TOURNEY_ORDER) AS CLAY_NAME FROM TOURNAMENTS_1877_2017 where tourney_surface = 'Clay' GROUP BY TOURNEY_YEAR) CLAY FULL OUTER JOIN (SELECT TOURNEY_YEAR, COUNT(TOURNEY_ID) AS HARD_NUM, LISTAGG('# '||TOURNEY_NAME,'<br />') WITHIN GROUP (ORDER BY TOURNEY_ORDER) AS HARD_NAME FROM TOURNAMENTS_1877_2017 where tourney_surface = 'Hard' GROUP BY TOURNEY_YEAR) HARD ON CLAY.TOURNEY_YEAR=HARD.TOURNEY_YEAR FULL OUTER JOIN (SELECT TOURNEY_YEAR, COUNT(TOURNEY_ID) AS GRASS_NUM, LISTAGG('# '||TOURNEY_NAME,'<br />') WITHIN GROUP (ORDER BY TOURNEY_ORDER) AS GRASS_NAME FROM TOURNAMENTS_1877_2017 where tourney_surface = 'Grass' GROUP BY TOURNEY_YEAR) GRASS ON NVL(CLAY.TOURNEY_YEAR,HARD.TOURNEY_YEAR)=GRASS.TOURNEY_YEAR FULL OUTER JOIN (SELECT TOURNEY_YEAR, COUNT(TOURNEY_ID) AS CARPET_NUM, LISTAGG('# '||TOURNEY_NAME,'<br />') WITHIN GROUP (ORDER BY TOURNEY_ORDER) AS CARPET_NAME FROM TOURNAMENTS_1877_2017 where tourney_surface = 'Carpet' GROUP BY TOURNEY_YEAR) CARPET ON NVL(NVL(CLAY.TOURNEY_YEAR,HARD.TOURNEY_YEAR),GRASS.TOURNEY_YEAR)=CARPET.TOURNEY_YEAR ORDER BY YEAR DESC";
	DbConnectUtil3 db = new DbConnectUtil3();
	db.conn = db.DbConnect();
 	db.stmt = db.DbStatement();
	db.rs = db.DbQuery(select1);
	while(db.rs.next()){
		%>
		<tr>			
			<td width="50" valign="top"><%=db.rs.getString("YEAR") %></td>
			<td width="40" valign="top"><%=db.rs.getInt("TOTAL_TOURNEY") %></td>
			<td width="60" valign="top"><%=db.rs.getInt("CLAY_NUM") %></td>
			<td width="330" valign="top"><div style="height:200px; overflow-y:scroll;"><%=db.rs.getString("CLAY_NAME") %></div></td>
			<td width="60" valign="top"><%=db.rs.getInt("HARD_NUM") %></td>
			<td width="330" valign="top"><div style="height:200px; overflow-y:scroll;"><%=db.rs.getString("HARD_NAME") %></div></td>
			<td width="60" valign="top"><%=db.rs.getInt("GRASS_NUM") %></td>
			<td width="330" valign="top"><div style="height:200px; overflow-y:scroll;"><%=db.rs.getString("GRASS_NAME") %></div></td>
			<td width="80" valign="top"><%=db.rs.getInt("CARPET_NUM") %></td>
			<td width="260" valign="top"><div style="height:200px; overflow-y:scroll;"><%=db.rs.getString("CARPET_NAME") %></div></td>
		</tr>
		<%
	}
	db.DbClose();%>
</table>
</div>
<a href="TENLDNPG_LandingPage.jsp">＞Go Back to <b>"TENLDNPG_LandingPage"</b> screen</a></br></br>
</body>
</html>