<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.DBMS" %>
<%@ page import="utility.AccessCounter3" %>
<%@ page import="utility.DbConnectUtil3" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<img src="http://rainbow-engine.com/wp-content/uploads/2017/09/cropped-c8a03ed7.jpg" alt="" width="30%"/>
	<img src="http://rainbow-engine.com/wp-content/uploads/2017/09/cropped-c8a03ed7.jpg" alt="" width="30%"/>
	<img src="http://rainbow-engine.com/wp-content/uploads/2017/09/cropped-c8a03ed7.jpg" alt="" width="30%"/>
	<center>
		<h2 id="title">TENHTOHR</h2>
		<h3 id="subtitle">Head To Head Query Result Screen</h3>
		
		<%
		AccessCounter3 ac = new AccessCounter3();
		%>
		[ アクセスカウンター： <b>準備中</b> ]	
		<br /><br />	
	</center>
</head>
<body>
aaa
<table border="3" style="border-collapse: collapse">
<tr>
	<th>-- Ranking Date --</th>
	<th>-- Ranking Number --</th>
	<th>-- Ranking Points --</th>
	<th>-- Tourneys Played --</th>
</tr>
<%
String pl1 = request.getParameter("player01");
String select1 = "SELECT (RA.WEEK_YEAR||'/'||RA.WEEK_MONTH||'/'||RA.WEEK_DAY) AS RANK_DATE, RA.RANK_NUMBER, RA.RANKING_POINTS, RA.TOURNEYS_PLAYED FROM RANKINGS_1973_2017 RA, PLAYER_OVERVIEWS PO WHERE RA.PLAYER_SLUG=PO.PLAYER_SLUG AND RA.PLAYER_SLUG LIKE '%nishikori%'";
DbConnectUtil3 db = new DbConnectUtil3();
db.conn = db.DbConnect();
db.stmt = db.DbStatement();
db.rs = db.DbQuery(select1);
while(db.rs.next()){
	%>
	<tr>
		<td><%=db.rs.getString("RANK_DATE") %></td>
		<td><%=db.rs.getString("RANK_NUMBER") %></td>
		<td><%=db.rs.getString("RANKING_POINTS") %></td>
		<td><%=db.rs.getString("TOURNEYS_PLAYED") %></td>
	</tr>
	<%
}
db.DbClose();
%>
</table>
</br>
<a href="TENLDNPG_LandingPage.jsp">＞Tennis Database Landing Pageに戻る</a></br></br>
<a href="TENHRANCH_RankingChangeQuery.jsp" >＞Ranking Change Query Screen V2に戻る</a></br></br>
</body>
</html>