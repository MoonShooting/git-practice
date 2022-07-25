<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String terms1=request.getParameter("terms1");						
String terms1_ck=request.getParameter("terms1_ck");
String terms2=request.getParameter("terms2");
String terms2_ck=request.getParameter("terms2_ck");
String ch_consent=request.getParameter("ch_consent");

%>

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
				<input type="checkbox" name="terms_ck" id="terms1_ck"/><label for="terms1_ck">회원가입 약관에 동의합니다.</label><br></li>
				</ul>
				<ul>
				<li><textarea cols="50" rows="15" name="terms2" readonly>약관내용</textarea><br>
				<input type="checkbox" name="terms_ck" id="terms2_ck"/><label for="terms2_ck">개인정보 활용에 동의합니다.</label><br></li>
				</ul>
				<ul>
				<li><label><input type="checkbox" name="ch_consent" id="ch_censent" onclick="return allck()"/>전체 동의</label><br></li>
				<li><input type="submit" id="Join_sub_button" value="가입하기"/></li>
				</ul>
			</form>
		</div>
	</div>
</div>
</body>
<script>  
var ck1 = document.getElementById('terms1_ck').checked;
console.log(ck1);
var ck2 = document.getElementById('terms2_ck').checked;
console.log(ck2);
var allOk = document.getElementById('ch_censent').checked;
console.log(allOk);

function CheckForm() {alert('안녕'); console.log('어 오류찾아~');
	if(allck){//이부분 떼어가서 밑에서 따로 전체선택/해제 만들어보자.
		confirm("회원가입 하시겠습니까?");
		return false;//확인을 위해 false로 설정
	}else{
		if (ck1.checked == false) {//1번 체크여부 확인
	          alert("회원가입 약관에 동의하지 않으셨습니다. 체크하세요!");
	          ck1 = false;
	          f.ck1.focus();
	          return false;
		} else if (ck2.checked == false) {//2번 체크여부 확인
	          alert("개인정보 활용에 체크하지 않으셨습니다. 체크하세요.");
	          ck2 = true;
	          f.ck2.focus();
	          return false;
			}
       	}	  
    }
//alert('안녕'); console.log('오류찾아보자~'); 
function allck() {//전체 동의 클릭시 선택/해제 
	allck.forEach((checkbox) => {
		checkbox.checked = selectAll.checked
	})
	if (allOk.checked == false) {//전체 선택,해제 사용자 체크여부 확인
		alert("약관을 읽어보신 후 체크하세요.");
		return false;
	} else if(ck1.checked== true && ck2. checked == true && allOk.checked == true){
		alert("회원가입 ㄱㄱ?");
		return true;  
	}
} 
	/*  
	var ck1 = document.getElementById('terms1_ck');
	var ck2 = document.getElementById('terms2_ck');
	var allOk = document.getElementById('ch_censent');
	var allck = ck1.checked + ck2.checked;
	   
	   function CheckForm() {
	      allOk
		   if (allOk == true) {//전체 동의일 때(헷갈려서 뼈대만 만듦)
	         confirm("회원가입 하시겠습니까?");
	         
	      } else {
	      		if (ck1 != true) {//1번만 체크
	            alert("약관동의에 체크하지 않으셨습니다. 체크하세요.");
	            ck1 = false;
	            f.ck1.focus();
	            return false;
	         } else if (ck2 == false) {
	            alert("약관동의에 체크하지 않으셨습니다. 체크하세요.");
	            ck2 = true;
	            f.ck2.focus();
	            return false;
	         }
	      }
	      confirm("모든 약관에 동의하십니까?");	
	      return true;
	   } */
	   
	  /*checkbox마다 onclick넣어서 하는 방법(구글에서 서치한 방법임. 작동은 올바르게 되지 않아 주석처리 해둠)
	function CheckForm() {	
	var ckboxs = doucument.querySelectorAll("input[name='terms_ck']");//전체 체크박스
	var ckok = doucument.querySelectorAll("input[name='terms_ck']:checked");//선택된 체크박스	

	if(ckboxs.length === checked.length){
		selectall.checked = true;
		confirm("회원가입 하시겠습니까?");	
	} else {
		if (ck1 != true) {//1번만 체크
			alert("약관동의에 체크하지 않으셨습니다. 체크하세요.");
			ck1 = false;
			f.ck1.focus();
			return false;
		} else if (ck2 != true) {
			alert("약관동의에 체크하지 않으셨습니다. 체크하세요.");
			ck2 = true;
			f.ck2.focus();
			return false;
		}
		selectall.checked = false;
	}
	}
function selectAll(selectAll){
	const allck = document.getElementByName("terms_ck");//전체 동의 클릭시, 전체 체크박스 선택/해제
		allck.forEach((checkbox) => {
		checkbox.checked = selectAll.checked
		})
	}
	   */
</script>
</html>
