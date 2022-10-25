<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>oogu</title>
<style>
	/*공통 css*/
	a {color: #000;text-decoration: none;display:block}
	ul{list-style:none; padding-left: 0px;}
	.wrapper{width:1000px; margin: 0 auto;}


    
    /*main css*/
    .main {width: 100%;margin: 0 auto;background-color: #fff;padding-top: 30px;display:flex;flex-wrap: wrap; flex-direction: row-reverse;}
    .main h2 {margin: 0 auto;}
    .main ul {display: flex;flex-wrap: wrap;margin: 0px;margin-left: 10%;}
    .main ul li {width: 45%;border-radius: 50px;padding: 15px;margin: 30px 0px;}
    .main ul li img {width: 300px;height: 300px;border-radius: 50%;transition: 0.5s ease-in-out;overflow: hidden;}
    .main ul li img:hover {transform: rotateY(180deg)}
    .main .top_bt img {width: 20px;height: 20px;}
	.main .top_bt{float: right;}
	
</style>
</head>
<body>
	<jsp:include page ="header.jsp" flush="false"/>
	<div class="main">
		<h2>enjoyable experience</h2>
		<ul>
			<li><a href=""><img src="img/menu1.jpg"></a></li>
			<li><a href=""><img src="img/menu2.jpg"></a></li>
			<li><a href=""><img src="img/menu1.jpg"></a></li>
			<li><a href=""><img src="img/menu2.jpg"></a></li>
		</ul>
	</div>
	<jsp:include page ="footer.jsp" />
</body>
</html>