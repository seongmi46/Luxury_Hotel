<%@page import="com.bc.model.vo.ReserveVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.model.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 예약내역 상세보기 - 예약취소 / 변경 하기</title>
<%@ include file="../include.jspf" %>
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
<script>

	function modify_go(frm) {
		frm.action = "MyPage?type=modifybooking";
		frm.submit();
	}
	function cancel_go(frm) { 
		frm.action = "MyPage?type=cancelbooking";
		frm.submit();
	}
	function list_go(frm) {  
		frm.action = "MyPage?type=select&opt=1";
		frm.submit();
	}
</script>
</head>
<header>
<%@ include file="../navBar.jspf" %>
</header>
<body>
<br><br><br>
<div class="container">
<div class="center">

<form method="post">
	
	<h6>예약내역 상세보기</h6>
	<table class="table table-bordered bordertable">
		
		<tbody>
			<tr>
				<th>예약번호</th>
				<td>${rvo.rev_no }</td>
			</tr>
			<tr>
				<th>예약자명</th>
				<td>${rvo.rev_name }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${rvo.rev_email }</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${rvo.rev_phone }</td>
			</tr>
			<tr>
				<th>호텔이름</th>
				<td>${rvo.hotel_name }</td>
			</tr>
			<tr>
				<th>방번호</th>
				<td>${rvo.rev_room_no }</td>
			</tr>
			<tr>
				<th>입실날짜</th>
				<td>${rvo.rev_in.substring(0,10) }</td>
			</tr>
			<tr>
				<th>퇴실날짜</th>
				<td>${rvo.rev_out.substring(0,10) }</td>
			</tr>
			<tr>
				<th>예약가격</th>
				<td>${rvo.rev_price }</td>
			</tr>
			<tr>
				<th>비고</th>
				<c:if test="${rvo.rev_exist == 1}">
						<td>예약완료</td>
					</c:if>
					<c:if test="${rvo.rev_exist == 0}">
						<td>예약취소</td>
					</c:if>
				
			</tr>
			
		</tbody>
		
		<tfoot>
			<tr>
				<td colspan="2">
				<c:if test="${rvo.rev_exist == 1}">
					<input type="button" class="btn btn-warning" value="예약정보변경" onclick="modify_go(this.form)">
					<input type="button" class="btn btn-warning" value="예 약 취 소" onclick="cancel_go(this.form)">
					<input type="button" class="btn btn-warning" value="목 록 으 로" onclick="list_go(this.form)">
					<input type="hidden" value="cPage" onclick="${cPage }">
					<input type="hidden" name="rev_no" value="${rev_no}" >
				</c:if>
				<c:if test="${rvo.rev_exist == 0}">
					<input type="button" class="btn btn-warning" value="목 록 으 로" onclick="list_go(this.form)">
					<input type="hidden" value="cPage" onclick="${cPage }">
				</c:if>
				</td>
			</tr>
		</tfoot>
		
	
	
	
	</table>


</form>









</div>
</div>

<br><br><br>

</body>
<%@ include file="../footer.jspf" %>
</html>



















