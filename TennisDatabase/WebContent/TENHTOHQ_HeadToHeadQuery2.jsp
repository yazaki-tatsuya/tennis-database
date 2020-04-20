<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="utility.AccessCounter3" %>
<%@ page import="tennisdb.TennisUtils" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8" />
<link rel="stylesheet" type="text/css" href="css/Rainbow.css" />
<title>Head To Head</title>
	<img src="http://rainbow-engine.com/wp-content/uploads/2017/09/cropped-c8a03ed7.jpg" alt="" width="30%"/>
	<img src="http://rainbow-engine.com/wp-content/uploads/2017/09/cropped-c8a03ed7.jpg" alt="" width="30%"/>
	<img src="http://rainbow-engine.com/wp-content/uploads/2017/09/cropped-c8a03ed7.jpg" alt="" width="30%"/>
	<center>
		<h2 id="title">TENHTOHQ</h2>
		<h3 id="subtitle">Head To Head Query Screen Ver:02</h3>		
		<%
		Calendar cal1 = Calendar.getInstance();	System.out.println(cal1.getTime()+" : 001-Before Access Counter");
		AccessCounter3 ac = new AccessCounter3();
		Calendar cal2 = Calendar.getInstance();	System.out.println(cal2.getTime()+" : 002-After Access Counter");		
		%>
		[ Access Counter： <b><%=ac.GetAccessCount2("TENHTOHQ")%></b> ]	
		<br /><br />	
	</center>
	<script src='TENHTOHQ_HeadToHeadQuery_JS_v2_fix2.js' type='text/javascript' language='javascript' charset='utf-8'>	
	</script>
</head>
<body>
<form method="POST" action="TENHTOHR_HeadToHeadResult.jsp" name="tennis_query">
<table border="1">
	<tr>
		<th align="left">Player Name #1</th>
		<th align="left"></th>
		<th align="left">Player Name #2</th>
	</tr>
	<tr>
		<td>
			<input id="q_player01" type="text" name="player01"/><br/>
			<input type="button" value="検索１(Search Player1)" onClick="onClickGetPlayer1();window.open('TENHTOHQ_HeadToHeadQuery_Sub2.jsp?q_param='+onClickGetPlayer1()+'&q_button=1','Test','width=400,height=600')">
		</td>
		<td>vs</td>
		<td>
			<input id="q_player02" type="text" name="player02"/><br/>
			<input type="button" value="検索２(Search Player2)" onClick="onClickGetPlayer2();window.open('TENHTOHQ_HeadToHeadQuery_Sub2.jsp?q_param='+onClickGetPlayer2()+'&q_button=2','Test','width=400,height=600')">
		</td>
	</tr>
</table>
<%Calendar cal7 = Calendar.getInstance();	System.out.println(cal7.getTime()+" : 007-Before Form Move"); %>
</br>
<input type="submit" value="Send" onclick="onButtonClick();" class="indent_form" /><br/>
<input id="qhid_player01" type="hidden" name="hid_player01"/>
<input id="qhid_player02" type="hidden" name="hid_player02"/>
</form>
<br />
<a href="TENLDNPG_LandingPage.jsp">＞Tennis Database Landing Pageに戻る</a>
</body>
</html>
