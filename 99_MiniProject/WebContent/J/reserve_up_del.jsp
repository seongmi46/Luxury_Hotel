<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.bc.model.DAO"%>
<%@page import="com.bc.model.vo.ReserveVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String rev_no = request.getParameter("rev_no");
ReserveVO reserve = DAO.modify1(rev_no);
pageContext.setAttribute("reserve", reserve);

SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyymmdd");
String rev_in = reserve.getRev_in().substring(0,10);
String rev_out = reserve.getRev_out().substring(0,10);
System.out.println(">>indate : " + rev_in);
System.out.println(">>outDate : " + rev_out);
pageContext.setAttribute("rev_in", rev_in);
pageContext.setAttribute("rev_out", rev_out);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약내역 수정/취소</title>
<%@ include file="../include.jspf" %>
<script>
	function index_go(frm) {
		frm.action = "index.jsp";
		frm.submit();
	}
</script>
</head>
<header>
<%@ include file="../navBar.jspf" %>
</header>
<style>
	.div{
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
<body>
	<div class="div">
	<P>HOTELS&RESORTS</P>
	<h1>관리자 페이지</h1>
	</div>
	<h3>예약내역 수정/취소</h3>
	<hr>
	<form action="reserveupdate" method="post">
		<p>예약번호 : <input type="text" name="rev_no" value="${reserve.rev_no }" readonly></p>
		<p>호텔번호 : <input type="text" name="hotel_no" value="${reserve.hotel_no }"readonly></p>
		<p>회원번호 : <input type="text" name="cust_no" value="${reserve.cust_no }" readonly></p>
		<p>방번호 : <input type="text" name="rev_room_no" value="${reserve.rev_room_no }"readonly></p>
		<p>체크인 : <input type="text" name="rev_in" value="${rev_in }"></p>
   		<p>체크아웃 : <input type="text" name="rev_out" value="${rev_out }"></p>
		<!--  
		<p>체크인 : <input type="text" name="rev_in" value="${reserve.rev_in }"></p>
		<p>체크아웃 : <input type="text" name="rev_out" value="${reserve.rev_out }"></p>
		-->
		<p>가격 : <input type="text" name="rev_price" value="${reserve.rev_price }" readonly></p>
		<p>취소여부 : <input type="text" name="rev_exist" value="${reserve.rev_exist }"readonly></p>
		<p>이름 : <input type="text" name="rev_name" value="${reserve.rev_name }"></p>
		<p>이메일 : <input type="text" name="rev_email" value="${reserve.rev_email }"></p>
		<p>전화번호 : <input type="text" name="rev_phone" value="${reserve.rev_phone }"></p>
		<p>숙박인원 : <input type="text" name="rev_people" value="${reserve.rev_people }"></p>
<br><br>
<div class="div1">
<input type="button" class="btn btn-warning" value="뒤로가기" onclick="history.back(-1);">
<input type="submit"  class="btn btn-warning" value="예약내역수정">
</div>
</form>
<form action="reservedelete" method="post">
<div class="div1">
<input type="hidden" value="${reserve.rev_no }" name="rev_no">
<button class="btn btn-warning" value="">예약취소</button>
<button class="btn btn-warning" value="" onclick="index_go(this.form)">메인페이지</button>
</div>
</form>
</body>
<%@ include file="../footer.jspf" %>
</html>