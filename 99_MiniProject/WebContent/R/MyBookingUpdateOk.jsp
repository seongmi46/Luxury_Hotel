<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약정보 수정 완료 창</title>
<%@ include file="../include.jspf" %>
<script>
	function mylist_go(frm) {
		frm.action="MyPage?type=select&opt=1";  
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
	
	<h6>예약자 정보가 변경되었습니다.</h6>
	
<form method="post">
	<table class="table table-bordered bordertable">
		<tr>
			<th>호텔명</th>
			<td>${rvo.hotel_name }</td>
		</tr>
		<tr>
			<th>입실날짜</th>
			<td>${rvo.rev_in }</td>
		</tr>
		<tr>
			<th>퇴실날짜</th>
			<td>${rvo.rev_out }</td>
		</tr>
		<tr>
			<th>예약자명</th>
			<td>${newrvo.rev_name }</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${newrvo.rev_phone }</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${newrvo.rev_email }</td>
		</tr>
	
	
	</table>
	
	
		<input type="button" class="btn btn-warning" value="예약목록보기" onclick="mylist_go(this.form)">
	
</form>
	
	
	</div>
</div>
	<br><br><br>
</body>
<%@ include file="../footer.jspf" %>
</html>