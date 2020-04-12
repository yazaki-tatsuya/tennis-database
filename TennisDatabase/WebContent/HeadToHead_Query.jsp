<%--
TennisUtilsにおいてプルダウンの選手リストをDBから取得し、ArrayListにaddする処理が非常に遅いため、本画面は原則的に利用しない(v2の方を用いる)。
v2ではプルダウンの代わりにテキストボックスに名前の一部を入力し、検索ボタンで一時画面を開いて候補を確定し、それを本体画面に反映する仕組みに変更。
ArrayListを使わない分、速度が劇的に向上しました。
--%>
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
		<h3 id="subtitle">Head To Head Query Screen</h3>
		
		<%
		Calendar cal1 = Calendar.getInstance();	System.out.println(cal1.getTime()+" : 001-Before Access Counter");
		AccessCounter3 ac = new AccessCounter3();
		Calendar cal2 = Calendar.getInstance();	System.out.println(cal2.getTime()+" : 002-After Access Counter");		
		%>
		[ TENHTOHQ画面のアクセスカウンター： <b><%=ac.GetAccessCount2("TENHTOHQ")%></b> ]	
		<br /><br />	
	</center>
	<script type='text/javascript' language='javascript'>	

		function onButtonClick(){
			elem1 = document.getElementById("output1");
			elem2 = document.getElementById("output2");
			elem1.innerHTML ="";
			elem2.innerHTML ="";

			//Get the lenght of prefecture pulldown and loop using that number
			for(i=0; i<document.tennis_query.q_player1.options.length; i++){
				if(document.tennis_query.q_player1.options[i].selected==true){
					elem1.innerHTML += document.tennis_query.q_player1.options[i].text;
				}
			}
			for(i=0; i<document.tennis_query.q_player2.options.length; i++){
				if(document.tennis_query.q_player2.options[i].selected==true){
					elem2.innerHTML += document.tennis_query.q_player2.options[i].text;
				}
			}
			//Give the final result of "elem" to the value of "prefhide"
			document.getElementById("hplayer1").value = elem1.innerHTML;
			document.getElementById("hplayer2").value = elem2.innerHTML;
		}
		function onClickGetPlayer(){
			return document.tennis_query.q_player01.value;
		}
	</script>
</head>
<body>
<form method="POST" action="HeadToHead_Result.jsp" name="tennis_query">
<%
TennisUtils te = new TennisUtils();
Calendar cal3 = Calendar.getInstance();	System.out.println(cal3.getTime()+" : 003-Before get player list");	
ArrayList<String> player1 = new ArrayList<String>(12000);
player1 = te.getPlayerList();
Calendar cal4 = Calendar.getInstance();	System.out.println(cal4.getTime()+" : 004-After get Player List");	
%>
■修正前
<table border="1">
	<tr>
		<th align="left">Player Name #1</th>
		<th align="left"></th>
		<th align="left">Player Name #2</th>
	</tr>
	<tr>
		<td>
			<select name="q_player1" style="margin-left:10px;">
				<%
				Calendar cal5 = Calendar.getInstance();	System.out.println(cal5.getTime()+" : 005-Start Selected Search");	
				for(int i=0; i<player1.size(); i++){
					if(player1.get(i).equals("Roger Federer")){
						Calendar cal6 = Calendar.getInstance();	System.out.println(cal6.getTime()+" : 006-Hit Selected Search");	
					%>
						<option selected value="list<%=i%>">Roger Federer</option>
					<%} else{%>
						<option value="list<%=i%>"><%=player1.get(i)%></option>
					<%}%>
				<%}%>
			</select>
		</td>
		<td>vs</td>
		<td>
			<select name="q_player2" style="margin-left:10px;">
				<%for(int i=0; i<player1.size(); i++){
					if(player1.get(i).equals("Rafael Nadal")){%>
						<option selected value="list<%=i%>">Rafael Nadal</option>
					<%} else{%>
						<option value="list<%=i%>"><%=player1.get(i)%></option>
					<%}%>
				<%}%>
			</select>
		</td>
	</tr>
</table>
</br>
<%Calendar cal7 = Calendar.getInstance();	System.out.println(cal7.getTime()+" : 007-Before Form Move"); %>
<input type="submit" value="Send" onclick="onButtonClick();" class="indent_form" /></br>
<div hidden id="output1"></div>
<div hidden id="output2"></div>
<input id="hplayer1" type="hidden" name="q_hplayer1"/>
<input id="hplayer2" type="hidden" name="q_hplayer2"/>
</form>
</body>
</html>
