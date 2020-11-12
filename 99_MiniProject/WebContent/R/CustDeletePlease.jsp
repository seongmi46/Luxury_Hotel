<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴하면 잃는 혜택!</title>
<%@ include file="../include.jspf" %>
<script>
	function deleteno(frm) {
		frm.action = "../S/reserveMain.jsp";
		frm.submit();
	}
	
	function deleteok(frm) {
		alert("탈퇴가 완료되었습니다. \n그동안 이용해주셔서 감사합니다");
		frm.action = "MyPage?type=deleteok";
		frm.submit();
	}
</script>
<style>
	.center {
		display: inline-block;
		text-align: center;
		width:100%;
		height: 400px;
	}
	table {
		margin-left: auto;
		margin-right: auto;
	}
</style>

</head>
<header>
<%@ include file="../navBar.jspf" %>
</header>
<body>
	<br><br><br>
<div class="container">
<div class="center">
	
	<p>[${cvo.cust_name }]님 지금 회원을 탈퇴하시면...</p>
	<h4>최성미 쉐프의 손맛이 담긴 프리미엄 조식</h4>
	<h4>최정혁 구조요원와 함께하는  안전한 수영</h4>
	<h4>김래영 딜러와 함께하는 인생역전 카지노</h4>
	<h4>김경난 전문가가 선사하는 릴렉스한 스파</h4>
	<p>를 더이상 받을 수 없습니다. 정말로 회원을 탈퇴하시겠습니까?</p>
	
	<form method="post">
		<input type="button" class="btn btn-warning" value="취소" onclick="deleteno(this.form)">
		<input type="button" class="btn btn-warning" value="탈퇴" onclick="deleteok(this.form)">
	
	</form>
	
</div>
</div>
</body>
<%@ include file="../footer.jspf" %>
</html>