<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔추가</title>
<%@ include file="../include.jspf" %>
</head>
<style>
	.div{
		text-align: center;
	}
	.div1{
		font-family: '나눔고딕',NanumGothic,'맑은고딕',MalgunGothic,'돋움',Dotum,Helvetica,sans-serif;
		font-size: 12px;      
		border:1px solid #ededed !important;
		font-weight: normal;          
		line-height: 19px;
		color:#20232;
		padding-top: 9px !important;
		padding-bottom: 7px !important;
		vertical-align:middle;
		text-align:center;
	}
</style>
<header>
<%@ include file="../navBar.jspf" %>
</header>
<body>
	<div class="div">
	<P>HOTELS&RESORTS</P>
	<h1>관리자 페이지</h1>
	</div>

	<h3>호텔추가</h3>
	<hr>
	<div calss="div1">
	<form action="hotelinsert" method="post">
		<p>호텔이름: <input type="text" name="hotel_name"></p>
		<p>호텔전화번호: <input type="text" name="hotel_tel"></p>
		<p>호텔주소: <input type="text" name="hotel_addr"></p>
		<p>호텔사진 : <input type="text" name="hotel_image"></p>
		<br><br>
		<div class="div1">
		<input type="button" value="뒤로가기" onclick="history.back(-1);">
		<input class="hotelinsert" type="submit" value="호텔추가하기">
		</div>
	</form>
</body>
<%@ include file="../footer.jspf" %>
</html>