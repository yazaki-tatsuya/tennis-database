<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="database.DBMS" %>
<%@ page import="utility.AccessCounter3" %>
<%@ page import="utility.DbConnectUtil3" %>
<%@ page import="tennisdb.TennisUtils" %>
<html class="font_1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0" />
<link rel="stylesheet" type="text/css" href="css/CommonUtility.css">
<link rel="stylesheet" type="text/css" href="css/TennisDatabase.css">
<%TennisUtils tu = new TennisUtils();%>
<title><%=tu.TENRACHR%></title>
	<img src="http://rainbow-engine.com/wp-content/uploads/Common/20200725_HeaderIcon.jpg" alt="" class="header_img"/>
	<center>
		<h1 class="hide"><%=tu.TENHTOHQ%></h1>
		<h2 id="title" class="title_narrow">TENRACHR</h2>
		<h3 id="subtitle" class="title_narrow"><%=tu.TENRACHR%></h3>		
		<%
		AccessCounter3 ac = new AccessCounter3();
		%>
		[ アクセスカウンター： <b><%=ac.GetAccessCount2("TENRACHR")%></b> ]	
		<br />
	</center>
</head>
<body>
Line chart of Ranking movement/ランキング推移グラフ&#x1f3be;<br /><br />
<table border="1">
	<tr>
		<th align="left">&#x1f3be;Player Name #1</th>
		<%if(!request.getParameter("player02").equals("")){%>
			<th align="left">&#x1f3be;Player Name #2</th>
		<%}%>
	</tr>
	<tr>
		<td>
			<b><%=request.getParameter("player01")%></b>
		</td>
		<%if(!request.getParameter("player02").equals("")){%>
		<td>
			<b><%=request.getParameter("player02")%></b>
		</td>
		<%}%>

	</tr>
</table>
<div style="height:500px; width:100%; overflow-y:scroll;" class="scroll-touch">
<%--<table border="3" style="border-collapse: collapse">--%>
<%--Start logic for "Player1"--%>
<%
	String select1 = "SELECT (PO.FIRST_NAME || ' ' || PO.LAST_NAME) AS FULL_NAME, (RA.WEEK_YEAR||'/'||RA.WEEK_MONTH||'/'||RA.WEEK_DAY) AS RANK_DATE, RA.RANK_NUMBER, RA.RANKING_POINTS, RA.TOURNEYS_PLAYED, TO_DATE((RA.WEEK_YEAR||'/'||RA.WEEK_MONTH||'/'||RA.WEEK_DAY),'YYYY-MM-DD') AS SORT_DATE FROM RANKINGS_1973_2017 RA, PLAYER_OVERVIEWS PO WHERE RA.PLAYER_SLUG=PO.PLAYER_SLUG AND (PO.FIRST_NAME || ' ' || PO.LAST_NAME) = '";
	String select2 = "'";
	String select3 = " ORDER BY SORT_DATE";
	ArrayList<Integer> ch1_1 = new ArrayList<Integer>();
	ArrayList<String> ch1_2 = new ArrayList<String>();
	ArrayList<String> ch1_3 = new ArrayList<String>();
	
	//## Start logic for "Player1" / "Player2"
	
	String pl1 = request.getParameter("player01");
	String select_fix = select1 + pl1 + select2;
	String pl2 = request.getParameter("player02");
	if(!pl2.equals("")){
		select_fix = select_fix + " UNION " + select1 + pl2 + select2 + select3;
	}	
	DbConnectUtil3 db = new DbConnectUtil3();
	db.conn = db.DbConnect();
	db.stmt = db.DbStatement();
	db.rs = db.DbQuery(select_fix);
	while(db.rs.next()){
		ch1_1.add(db.rs.getInt("RANK_NUMBER"));
		ch1_2.add(db.rs.getString("FULL_NAME"));
		ch1_3.add(db.rs.getString("RANK_DATE"));	
	}
	db.DbClose();
	session.setAttribute("chart1_1",ch1_1);
	session.setAttribute("chart1_2",ch1_2);
	session.setAttribute("chart1_3",ch1_3);		
%>
<img src="JFreeChartDraw?mode=2" />
</div>
<a href="TENLDNPG_LandingPage.jsp">＞Go Back to <b>"TENLDNPG_LandingPage"</b> screen</a></br>
<a href="TENRANCH_RankingChangeQuery.jsp" >＞Go Back to <b>"TENRANCH_RankingChangeQuery"</b> screen</a></br>
</body>
</html>