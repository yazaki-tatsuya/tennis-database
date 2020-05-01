<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="utility.AccessCounter3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<img src="http://rainbow-engine.com/wp-content/uploads/2017/09/cropped-c8a03ed7.jpg" alt="" width="30%"/>
	<img src="http://rainbow-engine.com/wp-content/uploads/2017/09/cropped-c8a03ed7.jpg" alt="" width="30%"/>
	<img src="http://rainbow-engine.com/wp-content/uploads/2017/09/cropped-c8a03ed7.jpg" alt="" width="30%"/>
	<center>
		<h2 id="title">TENLDNPG</h2>
		<h3 id="subtitle">Tennis Database Landing Page</h3>
		<h4 id="subtitle">&#x1f3be;&#x1f3be;&#x1f3be;&#x1f3be;Welcome to the tennis database page.&#x1f3be;&#x1f3be;&#x1f3be;&#x1f3be;</h4>
		&#x1f3be;About Our Site (English)&#x1f3be;<br />
		This site provides information of Tennis ATP Tour men's singles information from various perspectives.<br />
		For examples, like "Head to Head results" and "Grand Slam Winned Times Ranking" and so on.<br />
		Please help yourself with the functions which matches the information you are looking for !<br /><br />
		&#x1f3be;About Our Site (Japanese)&#x1f3be;<br />
		このサイトではテニスのATPツアー男子シングルスに関する様々なデータを提供します。<br />
		例えば「指定した２選手の対戦成績」や「グランドスラムの優勝回数ランキング」など様々な観点の情報があります。<br/>
		下記の中から好きな画面を開いて、情報を検索してみてください！<br /><br /><br /><br />
		<%
		AccessCounter3 ac3 = new AccessCounter3();
		%>
		[ Access Counter：<b><%=ac3.GetAccessCount2("TENLDNPG")%></b> ]
		<br /><br />
	</center>
	
</head>
<body>
<form method="POST" name="tennis_query">
<table border="1">
	<tr>
		<th>Function ID<br />(Link URL)</th>
		<th>Function Name</th>
		<th>Category<br />(区分)</th>
		<th>Description<br />(English)</th>
		<th>Description<br />(Japanese)</th>
	</tr>
	<tr>
		<td><a href="TENHTOHQ_HeadToHeadQuery2.jsp">TENHTOHQ</a></td>
		<td>Head To Head Query Screen Ver.02</td>
		<td>Win-Loss<br />(対戦成績)</td>
		<td>In this screen, we can give the name of 2 players and query the Head to Head results of them.</td>
		<td>この画面ではユーザーが指定した２選手の対戦成績を見ることができます。</td>
	</tr>
	<tr>
		<td><a href="TENRANCH_RankingChangeQuery.jsp">TENRANCH</a></td>
		<td>Ranking Change View Screen</td>
		<td>Ranking<br />(ランキング)</td>
		<td>In this screen, we can give the name of player and check the ranking change through his carreer.</td>
		<td>この画面では指定した選手のランキングの推移を見る事ができます。</td>
	</tr>
</table>
</form>
</body>
</html>