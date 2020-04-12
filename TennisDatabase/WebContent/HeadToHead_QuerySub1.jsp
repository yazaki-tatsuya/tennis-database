<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="database.DBMS" %>
<%@ page import="utility.DbConnectUtil3" %>
<%@ page import="utility.AccessCounter3" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8" />
<link rel="stylesheet" type="text/css" href="css/Rainbow.css" />
<title>Head To Head</title>
	<img src="http://rainbow-engine.com/wp-content/uploads/2017/09/cropped-c8a03ed7.jpg" alt="" width="30%"/>
	<img src="http://rainbow-engine.com/wp-content/uploads/2017/09/cropped-c8a03ed7.jpg" alt="" width="30%"/>
	<img src="http://rainbow-engine.com/wp-content/uploads/2017/09/cropped-c8a03ed7.jpg" alt="" width="30%"/>
	<script type='text/javascript' language='javascript'>	
		//【親子連動】子画面のテキストボックス(q_player03)の値を親画面のテキストボックス(q_player01)に渡すJavaScriptの関数
		function onCallSub(){
			window.opener.document.getElementById("q_player01").value = document.getElementById("q_player03").value;
		}
		function onButtonUpdateOrigValue(){
			choose_player1 = document.tennis_subquery.choose_player;
			for(i=0; i<choose_player1.length; i++){
				if(choose_player1[i].checked){
					window.opener.document.getElementById("q_player01").value = choose_player1[i].value;		
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
//ユーザが画面の項目「Player1」か「Player2」に入力した値を取得
String param1 = request.getParameter("q_param1");
param1 = param1.toLowerCase();
String select_qs = "SELECT (FIRST_NAME || ' ' || LAST_NAME) AS PNAME,PLAYER_SLUG FROM PLAYER_OVERVIEWS WHERE LOWER(FIRST_NAME || ' ' || LAST_NAME) LIKE '%"+param1+"%' ORDER BY PLAYER_SLUG";
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
<input type="button" value="確定(Finalize)" onClick= "onButtonUpdateOrigValue();" />
</form>
<%db.DbClose();%>
<%--【親子連動テスト】 q_player03の初期値は親画面のq_player01の値です。その値を修正した場合、送信ボタンで親画面の値に反映できます。--%>
<%--
<input id="q_player03" type="text" name="q_hplayer03" value=<%=request.getParameter("q_param1")%>><br/>
<input type="button" value="送信" onClick="onCallSub();">
--%>
</body>
</html>