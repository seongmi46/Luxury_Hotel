<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글삭제</title>
<%@ include file="../include.jspf" %>
<header>
<%@ include file="../navBar.jspf" %>
</header>
<script>
	function ans_del(frm) {
		var isDelete = confirm("정말 삭제하시겠습니까?");
		if (isDelete) {
			frm.submit(); //삭제처리 진행
		} else {
			history.back(); //삭제취소하고 이전페이지로 이동
		}
	}
</script>
</head>
<body>
<form action="qna_ans_del" method="post">
	<input type="button" value="삭제" onclick="ans_del(this.form)">
</form>
	<br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br>
</body>
<%@ include file="../footer.jspf" %>
</html>