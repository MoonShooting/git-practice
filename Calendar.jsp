<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<% 
request.setCharacterEncoding("UTF-8");

Calendar cal = Calendar.getInstance(); //시스템의 현재 날짜와 시간정보를 얻기 위해 getInstance()메서드 사용함.

//오늘 날짜 알아보기
int toyear = cal.get(Calendar.YEAR);
int tomonth = cal.get(Calendar.MONTH);
int today = cal.get(Calendar.DATE);

int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH)+1;//기본값이 0이다.(미국은 월 자체를 단어 개념으로 이해해서 그런지 숫자 1로 시작하지 않음.)

String sy = request.getParameter("year");
String sm = request.getParameter("month");

if(sy != null) { //만약 파라미터 값이 null이 아니면
	year = Integer.parseInt(sy);//sy = int year다.
}
if(sm != null) {
	month = Integer.parseInt(sm);//sm = int month다.
}

//set()을 사용하여 전달된 Calendar 필드를 '특정 값'으로 설정.
cal.set(year, month-1, 1);//년(sy), 월(sm-1, 0 = 1월임.), 일
year = cal.get(Calendar.YEAR);
month = cal.get(Calendar.MONTH);

int week = cal.get(Calendar.DAY_OF_WEEK);//1(sunday)~7(saturday)가 기본값이다.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calendar JSP page</title>
<style>
	/*공통 css*/
	*{margin: 0px;padding: 0px; box-sizing: border-box;}
	ul {list-style: none;padding-left: 0;}
	body{font-size: 14px; font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;}
	a{color:#000; text-decoration: none; cursor: pointer;}	
	a:active, a:hover {text-decoration: underline; color: #f28011;}
	
	/*main css*/
	.main{width: 700px; margin: 100px auto;}
	.main .title{height: 37px; line-height: 37px; text-align: center; font-weight: 600;}
	
	/*main 요일 css*/
	.main .M_naming ul{display: flex; text-align: center;}
	.main .M_naming ul li{width: 14.28%; padding: 5px;}
	.main .M_naming .br{border-bottom: 2px solid black;}
	.main .M_naming ul:first-child{background: #f6f6f6};
	.main .M_naming li:nth-child(7n+1) {color: red;}
	.main .M_naming li:nth-child(7n) {color: blue;}
	.main .M_naming li.gray {color: gray;}
	.main .M_naming li.today {font-weight: 900; background: #e6ffff;}
	
	/*for문 도는 일자 css*/
	.main .cal ul{flex-wrap : wrap; text-align: left;}
	.main .cal ul li{padding: 0px 30px 30px 4px;}
	
	
</style>
</head>
<body>
	<div class="wrap">
		<div class="main">
		<div class="title">
			<a href="Calendar.jsp?year=<%=year-1%>">&lt;&lt;</a>
			<a href="Calendar.jsp?year=<%=year%>&month=<%=month%>">&lt;</a> <!-- &lt;는 <가 화면에 텍스트로 보여짐 -->
			<a href="Calendar.jsp?toyear=<%=toyear%>&tomonth=<%=tomonth%>&today=<%=today%>">
				<label><%=year %>년 <%=month+1 %>월</label></a><!-- 기본값이 0이여서 오늘 기준 현재 달을 설정하려니 7월이 되어서 +1함 -->
			<a href="Calendar.jsp?year=<%=year%>&month=<%=month+2%>">&gt;</a><!-- &lt;는 >를 화면에 텍스트로 보여짐 -->
			<a href="Calendar.jsp?year=<%=year+1%>">&gt;&gt;</a>
		</div>
		<div class="M_naming">
			<ul class="br">
				<li>일</li>
				<li>월</li>
				<li>화</li>
				<li>수</li>
				<li>목</li>
				<li>금</li>
				<li>토</li>
			</ul>
			<div class="cal">
				<%
				//1일기준 앞선 이전 달 부분
				Calendar preCal = (Calendar)cal.clone();//clone()메서드를 통해 캘린더에 복사, 붙여넣기 한다.
				preCal.add(Calendar.DATE, -(week-1));//일, -(주-1)을 preCal에 추가한다.
				int preDate = preCal.get(Calendar.DATE);
				out.print("<ul>");//ul로 넣어줄 부분
				//1일 앞 부분(일수, 주)
				for(int i=1; i<week; i++) {
					out.print("<li class='gray'>"+(preDate++)+"</li>");//앞선 달에 관한 일자를 호출하여 출력후 값을 더하고 다시 반복하여 출력한다.
				}
				
				//선택한 해당 월 출력(1일부터 말일까지의 본문)
				int lastDay = cal.getActualMaximum(Calendar.DATE);
				//cal.getActualMaximum()=기준 월의 마지막 날짜를 구하는 함수.
				//(파라미터로 Calendar.DAY_OF_MONTH 를 넘겨 주어야 말일을 리턴 받을 수 있다.) 
				String cls;
				for(int i=1; i<=lastDay; i++) {
					cls = year==toyear && month==tomonth && i==today ? "today":"day";
					/* for(int j=1; j <=lastDay; j++){
						s_date = year==toyear && month==tomonth && i==today ? "s_date":"s_date";
						s_date += j++;
					}
						*/
					out.println("<li class='"+cls+"'><div class='"+i+"'><a>");//div 반복돌릴거 생각해보기!
					out.println(i);
					out.println("</a></div></li> \n ");
				}
				
				//마지막 주 마지막 일자 다음 부분(다음달의 앞 주,일)
				int n = 1; //여기서 syso로 week값을 찍어보면 week=2인 상태임.
				for(int i = (week-1)%7; i<6; i++){//i = (2-1)%7(결과값은 i=1); i<6(=i가 5까지 반복함.); i증감식
				out.print("<li class='gray'>"+(n++)+"</li>");
					if(lastDay != i && (++week)%7 == 1){
						out.print("</li><li>");
					}
				}
				out.print("</ul>");//ul종료
				%>
			</div>
		</div>
		<!-- <div class="footer">
			<a href="Calendar2.jsp">오늘날짜로</a>
		</div> -->
		</div>
	</div>
</body>
</html>
