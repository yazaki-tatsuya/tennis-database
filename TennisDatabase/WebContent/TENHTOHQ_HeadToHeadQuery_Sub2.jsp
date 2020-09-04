<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="database.DBMS" %>
<%@ page import="utility.DbConnectUtil3" %>
<%@ page import="utility.AccessCounter3" %>
<!DOCTYPE html>
<html class="font_1">
<head>
<meta http-equiv="Content-Type" charset="UTF-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0" />
<link rel="stylesheet" type="text/css" href="css/CommonUtility.css">
<title>Query Sub Screen</title>
	<img src="http://rainbow-engine.com/wp-content/uploads/2017/09/cropped-c8a03ed7.jpg" alt="" width="31%"/>
	<img src="http://rainbow-engine.com/wp-content/uploads/2017/09/cropped-c8a03ed7.jpg" alt="" width="31%"/>
	<img src="http://rainbow-engine.com/wp-content/uploads/2017/09/cropped-c8a03ed7.jpg" alt="" width="31%"/>
	<script type='text/javascript' language='javascript'>	
		//【親子連動テスト】子画面のテキストボックス(q_player03)の値を親画面のテキストボックス(q_player01)に渡すJavaScriptの関数
		//実験的に作ったので基本は使いません・・
		/*
		function onCallSub(){
			console.log("aaaaa");
			window.opener.document.getElementById("q_player02").value = document.getElementById("q_player03").value;
		}
		*/
		function onButtonUpdateOrigValue(){
			choose_player = document.tennis_subquery.choose_player;
			//----Debug Code Start----//
			var toString = Object.prototype.toString;
			console.log("output type: "+toString.call(choose_player));
			console.log("choose_player: "+choose_player);
			console.log("length: "+choose_player.length);
			//----Debug Code End----//
			//(1)When the search result is only 1 record, the object type will be HTMLInputElement. Since it is not a list, cannot loop using "for" so just get the value.
			if(toString.call(choose_player)=="[object HTMLInputElement]"){
				console.log("object is HTMLInputElement");
				if(choose_player.checked){
					if(document.tennis_subquery.hbutton_no.value=="1"){
						window.opener.document.getElementById("q_player01").value = choose_player.value;	
					}else if(document.tennis_subquery.hbutton_no.value=="2"){
						window.opener.document.getElementById("q_player02").value = choose_player.value;	
					}
				}
			}
			//(2)When the search result is multiple records, the object type will be RadioNodeList, so loop using the "length" property.
			else{
				for(i=0; i<choose_player.length; i++){
					console.log("player value "+i+" : "+choose_player[i].value);
					if(choose_player[i].checked){
						if(document.tennis_subquery.hbutton_no.value=="1"){
							window.opener.document.getElementById("q_player01").value = choose_player.value;	
						}else if(document.tennis_subquery.hbutton_no.value=="2"){
							window.opener.document.getElementById("q_player02").value = choose_player.value;	
						}	
					}
				}				
			}
			window.close();
		}
	</script>
</head>
<body>
<form name="tennis_subquery">
<table border="3" style="border-collapse: collapse">
<tr>
	<th>Player Name</th>
</tr>
<%
//URLパラメータ「button」から、押されたボタンの番号を取得して隠し項目「button_no」に入れる
String button = request.getParameter("q_button");
%>
<input id="hbutton_no" type="hidden" name="button_no" value="<%=button%>">
<%
//URLパラメータ「q_param」から、ユーザが画面の項目「Player1」か「Player2」に入力した値を取得
String param = request.getParameter("q_param");
param = param.toLowerCase();
String select_qs = "SELECT (FIRST_NAME || ' ' || LAST_NAME) AS PNAME,PLAYER_SLUG FROM PLAYER_OVERVIEWS WHERE LOWER(FIRST_NAME || ' ' || LAST_NAME) LIKE '%"+param+"%' ORDER BY PLAYER_SLUG";
DbConnectUtil3 db = new DbConnectUtil3();
db.conn = db.DbConnect();
db.stmt = db.DbStatement();
db.rs = db.DbQuery(select_qs);
int j=1;
while(db.rs.next()){
%>
	<tr>
		<td>
			<%--部分一致した候補をすべてラジオボタンで表示。<label>タグを付ける事でテキスト部分をクリックしてもラジオ選択できるようになる--%>
			<input id="fix_player<%=j%>" type="radio" name="choose_player" value="<%=db.rs.getString("PNAME")%>">
			<label for="fix_player<%=j%>"><%=db.rs.getString("PNAME") %></label>
		</td>
	</tr>
	<%j++;
}
%>
</table>
<%--【親子連動テスト】--%><%--<input type="button" value="update" onClick= "onCallSub();"/>--%>
<input type="button" value="確定(Finalize)" onClick= "onButtonUpdateOrigValue();"/>
</form>
<%db.DbClose();%>
<%--【親子連動テスト】 q_player03の初期値は親画面のq_player01の値です。その値を修正した場合、送信ボタンで親画面の値に反映できます。--%>
<%--
<input id="q_player03" type="text" name="q_hplayer03" value=<%=request.getParameter("q_param1")%>><br/>
<input type="button" value="送信" onClick="onCallSub();">
--%>
</body>
</html>