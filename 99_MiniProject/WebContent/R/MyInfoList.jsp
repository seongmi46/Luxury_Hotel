<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보조회</title>
<%@ include file="../include.jspf" %>
<script>
	function updatePwd(frm) {
		frm.action = "MyPage?type=updatepwd";
		frm.submit();
	}
	
	
	function deleteme(frm) {
		frm.action = "MyPage?type=deleteme";
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
.name{width:20%;}
</style>
</head>
<header>
<%@ include file="../navBar.jspf" %>
</header>
<body>
<br><br><br>
	<div class="container">
<div class="center">
	
	
	<table class="table table-bordered bordertable">
		<tr>
			<th class="name">이름</th>
			<td>${cvo.cust_name }</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${cust_id }</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${cvo.cust_phone }</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${cvo.cust_email }</td>
		</tr>
		
	</table>

	<form method="post">
		<input type="button" class="btn btn-warning" value="개인정보수정" onclick="updatePwd(this.form)">
		<input type="button" class="btn btn-warning" id="delete" value="회원탈퇴" onclick="deleteme(this.form)">
	</form>
	
	


</div>
</div>
<br><br><br>
</body>
<%@ include file="../footer.jspf" %>
</html>