<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약취소 완료 후 목록으로 이동 / 예약페이지로 이동</title>
<%@ include file="../include.jspf" %>
<script>
	function list_go(frm) {
		frm.action="MyPage?type=select&opt=1";
		frm.submit();
	}
	function main_go(frm) {
		frm.action="../S/reserveMain.jsp";
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


</style>




</head>
<header>
<%@ include file="../navBar.jspf" %>
</header>
<body>
<br><br><br>

<div class="container">
<div class="center">
	<h6>예약이 취소되었습니다. 감사합니다</h6>
	
	<form method="post">
		<input type="button" class="btn btn-warning" value="목록으로 이동" onclick="list_go(this.form)">
		<input type="button"class="btn btn-warning"  value="메인으로 이동" onclick="main_go(this.form)">
	</form>







</div>
</div>

</body>
<%@ include file="../footer.jspf" %>
</html>