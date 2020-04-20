function onButtonClick(){
	/* This is the proccess when [Send] is pressed .
	 * Get the value of player1 and player2, and finally copy that value to the hidden element <div id="outputN">. 
	 * This value will "POST"ed by <form> and be used in the SQL in next screen.
	*/
	/*Copy the value of "q_playerN" to "qhid_playerN" which will be passed to the next screen by <form>
	 * (Actually there is no neeed to copy, but just for learning purpose I will copy the value to the hidden field)
	*/
	document.getElementById("qhid_player01").value = document.getElementById("q_player01").value;
	document.getElementById("qhid_player02").value = document.getElementById("q_player02").value;
}

function onClickGetPlayer1(){
	/* Get the information selected in "Player1" field */
	return document.tennis_query.player01.value;
}

function onClickGetPlayer2(){
	/* Get the information selected in "Player2" field */
	return document.tennis_query.player02.value;
}