<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title><%=tu.TENSVACR%></title>
	<%--
	<img src="http://rainbow-engine.com/wp-content/uploads/Common/20200725_HeaderIcon.jpg" alt="" class="header_img"/>
	--%>
	<center>
		<h1 class="hide"><%=tu.TENSVACR%></h1>
		<h2 id="title" class="title_narrow">TENSVACR</h2>
		<h3 id="subtitle" class="title_narrow"><%=tu.TENSVACR%></h3>
		
		<%
		AccessCounter3 ac = new AccessCounter3();
		%>
		[ アクセスカウンター： <b>準備中</b> ]	
		<br />
	</center>
	<br />
	&#x1f3be;List tournament number for each surface type/年度別の各サーフェスのトーナメント数&#x1f3be;<br /><br />
	<script type='text/javascript' language='javascript'>	
		function onButtonClick(){
			document.getElementById("qhid_player01").value = document.tennis_query.q_player01.value;
		}
	</script>
</head>
<body>
<form method="POST" action="HeadToHead_Result.jsp" name="tennis_query">
<table border="1">
	<tr>
		<th align="left">Player Name #1</th>
		<td>
			<input id="q_player01" type="text" name="player01"/>
		</td>
	</tr>
</table>
</form>
<div hidden id="output1"></div>
<input id="qhid_player01" type="text" name="hid_player01"/>
<input type="button" value="Copy" onclick="onButtonClick();" class="indent_form" /></br>
</body>
</html>