<!-- 숙박 고객 정보 입력받는 메뉴 -->


<%@page import="com.bc.hotel.dao.HotelDAO"%>
<%@page import="com.bc.hotel.vo.HotelVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하는 화면</title>
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
<script>
	function valueCheck(frm){
		var name = frm.name.value;
		var email = frm.email.value;
		var phone = frm.phone.value;

		if(name == ""){
			alert("이름을 입력해주세요.");
			frm.name.value = "";
			frm.name.focus();
			return false;
		}
		if(email == ""){
			alert("이메일을 입력해주세요.");
			frm.email.value = "";
			frm.email.focus();
			return false;
		}
		if(phone == ""){
			alert("연락처를 입력해주세요.");
			frm.phone.value = "";
			frm.phone.focus();
			return false;
		}
		frm.submit();
	}
</script>

</head>
<header>
<%@ include file="../navBar.jspf" %>
</header>


<body>
<br><br>
<form action="controller?type=reserveOk" method="post">
<div class="container">
::: 숙박하실 호텔 정보를 확인하세요 :::	
	<table class="table table-bordered bordertable">
	<tr>
		<td><p><img src="../images/${room.room_image }.jpg" alt="${room.room_name}" width="400px" height="300px"></p>
			${room.room_name }</td>
		<td width="500px"><p><img src="../images/${room.room_content }.jpg" alt="${room.room_name}" width="500px" height="350px"></p></td>
		<td><p>
		<c:if test="${room.room_spa=='0'}">스파:X</c:if>
		<c:if test="${room.room_spa=='1'}">스파:O</c:if><br>
		<c:if test="${room.room_cooking==0}">취사:X</c:if>
		<c:if test="${room.room_cooking==1}">취사:O</c:if><br>
		<c:if test="${room.room_smoking==0}">흡연:X</c:if>
		<c:if test="${room.room_smoking==1}">흡연:O</c:if>
		</p></td>
		<td><p>${room.room_price}</p></td>
	</tr>
	<tr>
		<td>체크인</td>
		<td colspan="3"><input type="text" class="form-control-plaintext" name="inDate" value="${inDate }" readonly></td>
	</tr>
	<tr>
		<td>체크아웃</td>
		<td colspan="3"><input type="text" class="form-control-plaintext" name="outDate" value="${outDate }" readonly></td>
	</tr>
	<tr>
		<td>인원</td>
		<td colspan="3"><input type="text" class="form-control-plaintext" name="people" value="${people }" readonly></td>
	</tr>
	</table>
</div>



<div class="container">
::: 숙박하실 고객님의 정보를 입력해주세요 :::	
<table class="table table-bordered bordertable">
	<tr>
		<td>아이디</td>
		<td><input type="text" class="form-control-plaintext" name="cust_id" value="${cust_id }" readonly>
			</td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" class="form-control-plaintext" name="name"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" class="form-control-plaintext" name="email"></td>
	</tr>
	<tr>
		<td>연락처</td>
		<td><input type="text" class="form-control-plaintext" name="phone"></td>
	</tr>
	<tr>
		<td colspan="4"><button type="button" class="btn btn-outline-warning" onclick="valueCheck(this.form)">입력완료</button></td>
	</tr>
	</table>
<input type="hidden" name="hotel_no" value="${hotel_no }">
<input type="hidden" name="room_no" value="${room_no }">
<input type="hidden" name="cust_no" value="${cust_no }">
<input type="hidden" name="price" value="${room.room_price}">
</div>



</form>
</body>
<%@ include file="../footer.jspf" %>
</html>