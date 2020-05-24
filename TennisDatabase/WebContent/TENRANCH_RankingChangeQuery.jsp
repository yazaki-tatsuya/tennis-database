<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="utility.AccessCounter3" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0" />
<link rel="stylesheet" type="text/css" href="css/CommonUtility.css">
<title>Head To Head</title>
	<img src="http://rainbow-engine.com/wp-content/uploads/2017/09/cropped-c8a03ed7.jpg" alt="" width="31%"/>
	<img src="http://rainbow-engine.com/wp-content/uploads/2017/09/cropped-c8a03ed7.jpg" alt="" width="31%"/>
	<img src="http://rainbow-engine.com/wp-content/uploads/2017/09/cropped-c8a03ed7.jpg" alt="" width="31%"/>
	<center>
		<h2 id="title">TENRANCH</h2>
		<h3 id="subtitle">Ranking Change View Screen</h3>	
		<%
		AccessCounter3 ac = new AccessCounter3();
		%>
		[ Access counter： <b><%=ac.GetAccessCount2("TENHTOHQ")%></b> ]	
		<br /><br />	
	</center>
	<script src='TENHTOHQ_HeadToHeadQuery_JS_v2_fix2.js' type='text/javascript' language='javascript' charset='utf-8'>	
	</script>
</head>
<body>
<%-- name="tennis_query" is duplicate name with "TENHTOHQ" screen, but the reason is because we are using "TENHTOHQ_HeadToHeadQuery_Sub2" as common component --%>
<%-- (It uses the form name "tennis_query" to return the query result, so we need to use the same value to recieve that value.) --%>
<form method="POST" action="TENRANCH_RankingChangeResult.jsp" name="tennis_query">
<table border="1">
	<tr>
		<th align="left">Player Name #1</th>
		<th align="left">Player Name #2</th>
	</tr>
	<tr>
		<td>
			<input id="q_player01" type="text" name="player01"/><br/>
			<input type="button" value="検索１(Search Player1)" onClick="onClickGetPlayer1();window.open('TENHTOHQ_HeadToHeadQuery_Sub2.jsp?q_param='+onClickGetPlayer1()+'&q_button=1','Test','width=400,height=600')">
		</td>
		<td>
			<input id="q_player02" type="text" name="player02"/><br/>
			<input type="button" value="検索２(Search Player2)" onClick="onClickGetPlayer2();window.open('TENHTOHQ_HeadToHeadQuery_Sub2.jsp?q_param='+onClickGetPlayer2()+'&q_button=2','Test','width=400,height=600')">
		</td>
	</tr>
</table>

<input type="submit" value="Send" onclick="onButtonClick();" class="indent_form" /><br/>
<input id="qhid_player01" type="hidden" name="hid_player01"/>
<input id="qhid_player02" type="hidden" name="hid_player02"/>
</form>
<br />
<a href="TENLDNPG_LandingPage.jsp">＞Go Back to <b>"TENLDNPG_LandingPage"</b> screen</a></br>
</body>
</html>