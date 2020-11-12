<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약취소-비밀번호확인</title>
<%@ include file="../include.jspf" %>
<script>
function cancelnow(frm) {
	var pwd1 = frm.pwd.value;
	var pwd2 = ${cvo.cust_pwd};  // DB에 있는 데이터
	if (pwd1 != pwd2) {
		alert("비밀번호가 일치하지 않습니다.\n비밀번호를 확인하세요.");
		frm.pwd.value="";  // 초기화
		frm.pwd.focus();  // 커서 여기 오게
		return false;
	}
	frm.action="MyPage?type=cancelbookingok";  
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

	
	<form method="post">
	<h6>비밀번호를 입력하세요</h6>
		<table>
			
			<tr>
				<td>
					<input type="password" name="pwd" title="비밀번호">
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" class="btn btn-warning" value="확인" onclick="cancelnow(this.form)">
					<input type="hidden" class="btn btn-warning" name="rev_no" value="${rvo.rev_no }">
				</td>
			</tr>
		</table>
	
	</form>
	

</div>
</div>
<%@ include file="../footer.jspf" %>

</body>
</html>