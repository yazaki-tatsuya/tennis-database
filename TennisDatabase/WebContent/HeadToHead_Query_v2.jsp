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
		<h3 id="subtitle">Head To Head Query Screen Version.02</h3>
		
		<%
		Calendar cal1 = Calendar.getInstance();	System.out.println(cal1.getTime()+" : 001-Before Access Counter");
		AccessCounter3 ac = new AccessCounter3();
		Calendar cal2 = Calendar.getInstance();	System.out.println(cal2.getTime()+" : 002-After Access Counter");		
		%>
		[ アクセスカウンター： <b><%=ac.GetAccessCount2("TENHTOHQ")%></b> ]	
		<br /><br />	
	</center>
	<script type='text/javascript' language='javascript'>	
		//選手プルダウンで選択されている値を取得し、最終的に<div id="outputN">の箇所にその値を表示する関数
		function onButtonClick(){
			elem1 = document.getElementById("output1");
			elem2 = document.getElementById("output2");
			elem1.innerHTML ="";
			elem2.innerHTML ="";

			//Get the lenght of prefecture pulldown and loop using that number
			for(i=0; i<document.tennis_query.q_player1.options.length; i++){
				//If the pull down is chosen, then get that value and show in elemN (=outputN)
				if(document.tennis_query.q_player1.options[i].selected==true){
					elem1.innerHTML += document.tennis_query.q_player1.options[i].text;
				}
			}
			for(i=0; i<document.tennis_query.q_player2.options.length; i++){
				if(document.tennis_query.q_player2.options[i].selected==true){
					elem2.innerHTML += document.tennis_query.q_player2.options[i].text;
				}
			}
			//Give the final result of "elem" to the value of "prefhide" which will be passed to the next screen by <form>
			document.getElementById("hplayer1").value = elem1.innerHTML;
			document.getElementById("hplayer2").value = elem2.innerHTML;
		}
		//ユーザが「選手１」項目に入力した内容を取得
		function onClickGetPlayer1(){
			return document.tennis_query.q_player01.value;
		}
		//ユーザが「選手２」項目に入力した内容を取得
		function onClickGetPlayer2(){
			return document.tennis_query.q_player02.value;
		}
	</script>
</head>
<body>
<form method="POST" action="HeadToHead_Result.jsp" name="tennis_query">
<table border="1">
	<tr>
		<th align="left">Player Name #1</th>
		<th align="left"></th>
		<th align="left">Player Name #2</th>
	</tr>
	<tr>
		<td>
			<input id="q_player01" type="text" name="q_hplayer01"/><br/>
			<input type="button" value="検索１(Search Player1)" onClick="window.open('HeadToHead_QuerySub1.jsp?q_param1='+onClickGetPlayer1(),'Test1','width=400,height=600')">
		</td>
		<td>vs</td>
		<td>
			<input id="q_player02" type="text" name="q_hplayer02"/><br/>
			<input type="button" value="検索２(Search Player2)" onClick="window.open('HeadToHead_QuerySub2.jsp?q_param2='+onClickGetPlayer2(),'Test2','width=400,height=600')">
		</td>
	</tr>
</table>
<%Calendar cal7 = Calendar.getInstance();	System.out.println(cal7.getTime()+" : 007-Before Form Move"); %>
</br>
<input type="submit" value="Send" onclick="onButtonClick();" class="indent_form" /></br>
<div hidden id="output1"></div>
<div hidden id="output2"></div>
<input id="hplayer1" type="hidden" name="q_hplayer1"/>
<input id="hplayer2" type="hidden" name="q_hplayer2"/>
</form>
</body>
</html>
