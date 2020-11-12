<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인 창</title>
<%@ include file="../include.jspf" %>
<script>
	function checkPwd(frm) {
		
		// DB에 있는 비밀번호랑 맞는지 확인 후 페이지 이동해야됨
		// 비밀번호 확인 후 수정처리
		var pwd1 = frm.pwd.value;
		var pwd2 = ${cvo.cust_pwd};  // DB에 있는 데이터
		if (pwd1 != pwd2) {
			alert("비밀번호가 일치하지 않습니다.\n비밀번호를 확인하세요.");
			frm.pwd.value="";  // 초기화
			frm.pwd.focus();  // 커서 여기 오게
			return false;
		}
		
		frm.action = "MyPage?type=updateform";
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
	.bordertable th, .bordertable td{
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
</head>
<header>
<%@ include file="../navBar.jspf" %>
</header>
<body>
<br><br><br>
<div class="container">
<div class="center">
<form method="post">
	<h6>비밀번호를 입력하세요</h6>
				<input type="password" name="pwd" title="비밀번호">
		<br><br>
				<input type="button" class="btn btn-warning" value="확인" onclick="checkPwd(this.form)">
</form>		

</div>
</div>
</body>
<%@ include file="../footer.jspf" %>
</html>