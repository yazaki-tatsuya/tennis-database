<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="utility.AccessCounter3" %>
<%@ page import="tennisdb.TennisUtils" %>
<!DOCTYPE html>
<html class="font_1">
<head>
<meta http-equiv="Content-Type" charset="UTF-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0" />
<link rel="stylesheet" type="text/css" href="css/CommonUtility.css">
<link rel="stylesheet" type="text/css" href="css/TennisDatabase.css">
<%TennisUtils tu = new TennisUtils();%>
<title><%=tu.TENHTOHQ%></title>
	<img src="http://rainbow-engine.com/wp-content/uploads/Common/20200725_HeaderIcon.jpg" alt="" class="header_img"/>
	<center>
		<h1 class="hide"><%=tu.TENHTOHQ%></h1>
		<h2 id="title" class="title_narrow">TENHTOHQ</h2>
		<h3 id="subtitle" class="title_narrow"><%=tu.TENHTOHQ%></h3>		
		<%
		//Performance testing code. When this JSP is called, this line of code will print the current time in the console
		//Calendar cal1 = Calendar.getInstance();	System.out.println(cal1.getTime()+" : 001-Before Access Counter");
		AccessCounter3 ac = new AccessCounter3();
		//Calendar cal2 = Calendar.getInstance();	System.out.println(cal2.getTime()+" : 002-After Access Counter");		
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
<%-- Performance testing code. When this JSP is called, this line of code will print the current time in the console --%>
<%--Calendar cal7 = Calendar.getInstance();	System.out.println(cal7.getTime()+" : 007-Before Form Move"); --%>
</br>
<input type="submit" value="Send" onclick="onButtonClick();" class="indent_form" /><br/>
<input id="qhid_player01" type="hidden" name="hid_player01"/>
<input id="qhid_player02" type="hidden" name="hid_player02"/>
</form>
<br />
<a href="TENLDNPG_LandingPage.jsp">＞Go Back to <b>"TENLDNPG_LandingPage"</b> screen</a></br></br>
</body>
</html>
