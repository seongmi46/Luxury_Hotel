<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage - select</title>
<link rel="stylesheet" type="text/css" href="css/style_home.css">
<script>
	function selectMypage(frm) {
		frm.action = "MyPage?type=select";
		frm.submit();
	}
</script>
</head>
<body>
 <div class="wrap">
    <header>
    <h1><a href="">Luxury Hotel</a></h1> 
    <p>The World Best Hotel &amp; Spa</p>
    </header>
    <nav>
    <ul>
        <li><a href="" target="main_area">객실</a></li>
        <li><a href="" target="main_area">프로모션</a></li>
        <li><a href="" target="main_area">다이닝</a></li>
        <li><a href="" target="main_area">스파</a></li>
    </ul> 

	<form method="post">
		<select name="opt" id="mypage" onchange="selectMypage(this.form)">
			<option value="" selected disabled>마이페이지</option>
			<option value="0">개인정보조회</option>
			<option value="1">예약내역</option>
			<option value="2">문의내역</option>
		</select>
	</form>
	</nav> 
	
	
	<article>
        <iframe name="main_area" src="" seamless="false" align="center" width="700px" height="600px" frameborder="0" scrolling="no"></iframe>
        
    </article>
	
	<footer>
        <p>
        비트캠프 서울시 서초구 강남대로 459 (서초동, 백암빌딩)｜ 사업자등록번호 : 214-85-24928
	(주)비트컴퓨터 서초본원 대표이사 : 조현정 / 문의 : 02-3486-9600 / 통신판매업 신고번호 : 제 서초-00098호 /
	Copyright (c) 비트캠프 All rights reserved.
        </p>    
    </footer>
    </div>
</body>
</html>