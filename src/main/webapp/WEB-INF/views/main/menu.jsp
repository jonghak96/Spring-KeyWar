<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript">
	function fighterPageMove() {
		location.href = "fighterSearch_click";
	}
	function boardPageMove() {
		location.href = "getVideoboardSearch";
	}
	function gymInfoPageMove() {
		location.href = "gymPage";
	}
	function freeBoardPageMove() {
		location.href = "getFreeboardSearch";
	}
</script>

<style>
	#menuContainer {
		width: 100%;
	}
	
	#title {
		font-size: 40px;
		font-family: bold;
	}
	
#bt {
  background-color: grey;
  border-radius: 10px;
  color: white;
  padding: 15px 30px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}

</style>
<center>
<div id="menuContainer">
	<button id="bt" onclick="fighterPageMove()">선수 정보</button> &emsp;&emsp;
	<button id="bt" onclick="boardPageMove()">결투영상</button>&emsp;&emsp; 
	<span id="title"> KeyWar </span> &emsp;&emsp;
	<button id="bt" onclick="gymInfoPageMove()">체육관</button>&emsp;&emsp;
	<button id="bt" onclick="freeBoardPageMove()">자유게시판</button>
</div>
</center>