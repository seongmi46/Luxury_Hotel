<!-- 예약정보 확인 후 예약 완료 페이지 -->



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약확인창</title>
 <%@ include file="../include.jspf" %>
<style>
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
<form action="controller?type=reserveEnd" method="post">
<div class="container">
<br><br>
:: 고객님의 예약 정보를 확인하세요
	<table class="table table-bordered bordertable">
	<tr>
		<td><p><img src="../images/${roonInfo.room_image }.jpg" alt="${roonInfo.room_name}" width="400px" height="300px"></p>
			${room.room_name }</td>
		<td width="500px"><p><img src="../images/${roonInfo.room_content }.jpg" alt="${roonInfo.room_name}" width="500px" height="350px"></p></td>
		<td><p>
		<c:if test="${roonInfo.room_spa=='0'}">스파:X</c:if>
		<c:if test="${roonInfo.room_spa=='1'}">스파:O</c:if><br>
		<c:if test="${roonInfo.room_cooking==0}">취사:X</c:if>
		<c:if test="${roonInfo.room_cooking==1}">취사:O</c:if><br>
		<c:if test="${roonInfo.room_smoking==0}">흡연:X</c:if>
		<c:if test="${roonInfo.room_smoking==1}">흡연:O</c:if>
		</p></td>
		<td><p>${roonInfo.room_price}</p></td>
	</tr>
	<tr>
		<td>체크인</td>
		<td colspan="3"><input type="text" class="form-control-plaintext" name="inDate" value="${rvo.rev_in }" readonly></td>
	</tr>
	<tr>
		<td>체크아웃</td>
		<td colspan="3"><input type="text" class="form-control-plaintext" name="outDate" value="${rvo.rev_out }" readonly></td>
	</tr>
	<tr>
		<td>인원</td>
		<td colspan="3"><input type="text" class="form-control-plaintext" name="people" value="${rvo.rev_people }" readonly></td>
	</tr>
	<tr>
		<td>아이디</td>
		<td colspan="3"><input type="text" class="form-control-plaintext" name="cust_id" value="${rvo.cust_id }" readonly>
			</td>
	</tr>
	<tr>
		<td>이름</td>
		<td colspan="3"><input type="text" class="form-control-plaintext" name="name" value="${rvo.rev_name }" readonly></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td colspan="3"><input type="text" class="form-control-plaintext" name="email" value="${rvo.rev_email }" readonly></td>
	</tr>
	<tr>
		<td>연락처</td>
		<td colspan="3"><input type="text" class="form-control-plaintext" name="phone" value="${rvo.rev_phone }" readonly></td>
	</tr>
	<tr>
		<td colspan="4"><button type="submit" class="btn btn-outline-warning">예약하기</button></td>
	</tr>
	</table>
<input type="hidden" name="hotel_no" value="${rvo.hotel_no }">
<input type="hidden" name="room_no" value="${rvo.rev_room_no }">
<input type="hidden" name="cust_no" value="${rvo.cust_no }">
<input type="hidden" name="price" value="${roonInfo.room_price}">
</div>

</form>

</body>
<%@ include file="../footer.jspf" %>
</html>