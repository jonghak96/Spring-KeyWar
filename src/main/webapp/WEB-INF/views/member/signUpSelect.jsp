<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function pageMove(value) {
		// 선택되면 true 안되면 false
		var check = document.getElementById("check").checked;
		
		if (check) {
			if (value.value == "bt1")
				location.href = "memberSignUp.jsp";
			else
				location.href = "gymSignUp.jsp";
		} else {
			alert("동의하세요");
		}		
	}	
</script>

</head>
<style>
#bt1, #bt2 {
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

#box {
	width: 1300px;	
	border: 1px solid black;
	text-align: left;
}

#left {
	text-align: left;
}

</style>
<body>


	<style>
	#bt {
	  background-color: grey;
	  border-radius: 8px;
	  color: white;
	  padding: 10px 20spx;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 15px;
	  margin: 4px 2px;
	  cursor: pointer;
	  float: right;
	}
</style>
	<button id="bt" onclick="mainPageMove()">메인 페이지로 이동</button> &emsp;&emsp;
	
	<center>	
		<div id="box">
			회사는 회원 가입시 다음과 같이 개인정보를 수집에 대한 동의를 받고 있습니다. 가입자가 아래 내용을 읽고 동의를 선택하여 클릭하면 개인정보 수집에 대해 동의한 것으로 간주합니다. <br>
			아래 내용은 수집하는 개인정보의 항목, 수집 및 이용 목적, 보유 및 이용 기간에 대한 안내이며 자세히 읽어보신 후 동의하여 주시기 바랍니다.<br>
			1. 수집하는 개인정보 및 이용 목적<br>
			회사는 이용자가 게시물 작성, 이벤트 참여, 상담 등의 서비스를 이용하기 위하여 회원가입을 신청할 경우, 회사는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.<br>
			
			- 수집 항목: ID, 비밀번호, 이메일 주소, 주소, 핸드폰 번호, 통신사<br>
			- 수집 목적: 회원제 서비스 이용, 본인 확인 및 개인 식별, 부정 이용 방지 등 회원 관리, 새로운 서비스 및 이벤트 정보 등의 안내, 이벤트 상품 배송<br>
			
			- 수집 항목: 이름, 생년월일, 핸드폰 번호<br>
			- 수집 목적: 중복 가입 방지, 부정 이용 방지<br>
			
			- 수집 항목: 클라이언트 정보, IP<br>
			- 수집 목적: 회원관리, 부정 이용 방지, 오류 상황 확인, 통계활용<br>
			
			- 수집 항목: 이름, 핸드폰 번호, 주소, 이메일 주소, IP<br>
			- 수집 목적: 이벤트 소식 SMS 발송, 이벤트 당첨 경품 배송<br>
			
			2. 개인정보의 보유 및 이용기간<br>
			회사는 회원이 회사가 제공하는 서비스를 받는 동안 회원의 개인정보를 보유합니다. 이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용 목적이 달성된 시점에서 지체없이 파기합니다.<br>
			
			
			▶ 수집 및 이용 목적이 달성된 시점<br>
			
			• 회원 가입 정보 : 회원을 탈퇴하거나 이용 계약을 해지할 때<br>
			• 대금 지급 정보 : 대금의 완제일 또는 채권의 소멸시효기간이 만료된 때<br>
			• 배송 정보 : 당해 설문조사나 이벤트 등이 종료한 때<br>
			• 본인 확인 정보 : 본인임을 확인한 때<br>
			회원이 서비스 이용 계약을 해지하거나 제명당한 경우라고 할지라도 서비스 이용의 혼선 방지, 권리남용 및 악용 방지, 명예훼손 등 권리 침해와 관련한 분쟁 및 수사 협조 의뢰에 대비하기 위한 목적으로 약관에 명시된 60일동안 이용자의 개인정보를 보유합니다. 이때에 해당 회원의 개인정보는 개인정보 보호를 위하여 별도로 분리하여 보관, 관리합니다.<br>
			
			
			※ 더 자세한 내용에 대해서는 사이트 하단의 개인정보처리방침을 참고하시기 바랍니다.<br>
		</div>
		<input type="radio" name="group" id="check">동의합니다
		<input type="radio" name="group">동의하지 않습니다. <Br>
		
		<button id="bt1" value="bt1" onclick="pageMove(this)">선수 회원가입</button>&emsp;&emsp;
		<button id="bt2" value="bt2" onclick="pageMove(this)">체육관 회원가입</button>
	</center>
	
	

	
	
</body>
</html>