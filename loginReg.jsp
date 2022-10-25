<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>    
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pw=request.getParameter("pw");

Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

try {
	Context init = new InitialContext();
	DataSource ds =(DataSource) init.lookup("java:comp/env/jdbc/projectDB");
	conn = ds.getConnection();
	
	pstmt=conn.prepareStatement("select * from userdata where id=?");
	pstmt.setString(1, id);//rs.{id/password, name, age ....}
	rs=pstmt.executeQuery();
	
	if(rs.next()){//boolean 참/거짓 
	/* 	rs.next() 참 -  아이디가 값이 있다. 그래서 아이디값을 비교할 수 있고, 비밀번호도 비교할 수 있다.=> 로그인이냐, 로그인이 아니면 비밀번호를 확인하라
		          거짓 - 애초에  userdata 아이디값이랑 이사람이 작성한 아디값이랑 안맞아 없어...너 뭔대ㅔ> 뭐쓴건데??
		        		   */
		//아이디값이 db의 값과 일치하고, 비밀번호값이 db의 값과 일치하는지 확인되면 로그인 후 메인으로 이동
		if(id.equals(rs.getString(1)) == true && pw.equals(rs.getString(2))== true) {
			//rs.getString(1)은 id와 동일, rs.getString(2)= pw와 동일하다. a
			session.setAttribute("id", id);//"세션에 설정한 이름값", 세션에 넣을 값(db데이터에서 뽑아 온 값)
			out.println("<script>");
			out.println("alert('올~로그인 성공!')");
			out.println("location.href='index.jsp'");
			out.println("</script>");
		}
		else{//비밀번호 불일치
			out.println("<script>");
			out.println("alert('비번 다시 확인ㄱㄱ')");
			out.println("location.href='login.jsp'");
			out.println("</script>");
			}
		}
	else{//해당 아이디에 관한 데이터가 존재하지 않는 경우
		out.println("<script>");
		out.println("alert('없는 아이디임. 다시 확인ㄱㄱ')");
		out.println("location.href='login.jsp'");
		out.println("</script>");
	}
} catch (Exception e) {
	out.println("<script>");
	out.println("alert('db데이터 가져오기 실패 삐삐삐!')");
	out.println("location.href='login.jsp'");
	out.println("</script>");
	e.printStackTrace();
} finally {
	try {
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	} catch(Exception e){
		e.printStackTrace();
	}
}

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>