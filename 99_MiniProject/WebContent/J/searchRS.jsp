<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약/회원 번호로 조회</title>
<%@ include file="../include.jspf" %>
<script>
	function index_go(frm) {
		frm.action = "index.jsp";
		frm.submit();
	}
	function modify(frm) {
		frm.action = "reserve_up_del.jsp";
		frm.submit();
	}
</script>
</head>
<header>
<%@ include file="../navBar.jspf" %>
</header>
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
	.div{
		text-align: center;
	}
	.div1{
		text-align: center;
	}
	.pagination {
 		justify-content: center;
	}
</style>
<body>
<br>
	<div class="div">
	<h1>관리자 페이지</h1>
	</div>
	<h3>예약/회원 번호로 조회</h3>
	<hr>
	<form>
	<table class="table table-bordered">
	<tr>
		<th class="th0">선택</th>
		<th class="th1">예약번호</th>
		<th class="th2">호텔번호</th>
		<th class="th3">회원번호</th>
		<th class="th4">방번호</th>
		<th class="th5">체크인</th>
		<th class="th6">체크아웃</th>
		<th class="th7">가격</th>
		<th class="th8">취소여부</th>
		<th class="th9">이름</th>
		<th class="th10">이메일</th>
		<th class="th11">전화번호</th>
	</tr>
	<c:forEach var="vo" items="${reserve }"> <tr>
		<td>
			<input type="radio" name="rev_no" value="${vo.rev_no}">
		</td>
		<td>
			${vo.rev_no }
		</td>
		<td>
		 	${vo.hotel_no }
		</td>
		<td>
			${vo.cust_no }
		</td>
		<td>
			${vo.rev_room_no }
		</td>
		<td>
			${vo.rev_in }
		</td>
		<td>
			${vo.rev_out }
		</td>
		<td>
			${vo.rev_price }
		</td>
		<td>
			${vo.rev_exist }
		</td>
		<td>
			${vo.rev_name }
		</td>
		<td>
			${vo.rev_email }
		</td>
		<td>
			${vo.rev_phone }
		</td>
	</tr>
	</c:forEach>

</table>
<br><br>
<div class="div1">
<input type="button" class="btn btn-warning" value="뒤로가기" onclick="history.back(-1);">
<button class="btn btn-warning" value="" onclick="modify(this.form)">예약수정/취소</button>
<button class="btn btn-warning" value="" onclick="index_go(this.form)">메인페이지</button>
</div>
</form>
	<br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br>
</body>
<%@ include file="../footer.jspf" %>
</html>