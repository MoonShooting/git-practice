<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 약관 페이지</title>
<style>
	/*공통 css*/
	.wrap{width: 500px; margin: 0px auto;}
	ul{list-style: none; padding-left: 0px;}
	
	/*main css*/
	.main{text-align: center;}
/*text타입*/	.main .termsck form input[type=text]{widows: 400px; height: 200px;}
/*전체동의*/	.main form input#ch_censent{margin-top: 40px; margin-bottom: 15px;}
/*checkbox왼쪽정렬*/	.main form input#terms1_ck, .main form input#terms2_ck{margin-left: -150px;}
/*가입하기*/	.main form input#Join_sub_button{padding: 20px; font-size: 20px; color: #fff; background: #363b9c; border: 1px solid #bbb;
				border-radius: 10px; margin-top: 20px;}
	</style>
</head>
<body>
<div>
	<div class="wrap">
		<div class="main">
			<h2>회원가입 약관</h2>
			<form action="Join.jsp" name="f" method="post" onsubmit="return CheckForm()">
				<ul class="termsck">
				<li><textarea cols="50" rows="15" name="terms1" readonly>약관내용</textarea><br>
				<input type="checkbox" name="terms1_ck" id="terms1_ck"/><label for="terms1_ck">회원가입 약관에 동의합니다.</label><br></li>
				</ul>
				<ul>
				<li><textarea cols="50" rows="15" name="terms2" readonly>약관내용</textarea><br>
				<input type="checkbox" name="terms1_ck" id="terms2_ck"/><label for="terms2_ck">개인정보 활용에 동의합니다.</label><br></li>
				<ul>
				<li><input type="checkbox" name="ch_consent" id="ch_censent"/>전체 동의<br></li>
				<li><input type="submit" id="Join_sub_button" value="가입하기"/></li>
				</ul>
			</form>
		</div>
	</div>
</div>
</body>
<%
request.setCharacterEncoding("UTF-8");
String terms1=request.getParameter("terms1");						
String terms1_ck=request.getParameter("terms1_ck");
String terms2=request.getParameter("terms2");
String terms2_ck=request.getParameter("terms2_ck");
String ch_consent=request.getParameter("ch_consent");

%>
<script>

	var check1 = document.getElementById('terms1_ck');//check1 체크박스버튼
	var check2 = document.getElementById('terms2_ck');//check2 체크박스버튼
	var allcheck = document.getElementById('ch_censent');//전체동의 체크
	//boolean checkOk = false;//모든 값이 체크된 경우에 대한 변수 선언(필요한가..?)
	function CheckForm() {
		if(check1 != true) {
			alert('동의에 체크하지 않으셨습니다. 체크하세요!');
			document.f.check1.focus();
			return false;
			break;
		}else if(check2 != true) {
			alert('동의에 체크하지 않으셨습니다. 체크하세요!');
			document.f.check2.focus();
			return false;
			break;
		}else if(allcheck == true){
			
		}else{
			location.href="Join.jsp";
		}
	}
</script>
</html>