<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방/호텔 번호로 룸 조회</title>
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
	<h3>방/호텔 번호로 룸 조회</h3>
	<hr>
	<form>
	<table class="table table-bordered">
	<tr>
		<th class="th0">방 번호</th>
		<th class="th1">호텔번호</th>
		<th class="th2">방이름</th>
		<th class="th3">방소개</th>
		<th class="th4">방 가격</th>
		<th class="th5">숙박인원</th>
		<th class="th6">스파유무</th>
		<th class="th7">요리유무</th>
		<th class="th8">흡연유무</th>
		<th class="th9">방 재고</th>
		<th class="th10">방 사진</th>
	</tr>
	<c:forEach var="vo" items="${hotelroom }"> <tr>
		<td>
			${vo.room_no }
		</td>
		<td>
		 	${vo.hotel_no }
		</td>
		<td>
			${vo.room_name }
		</td>
		<td>
			${vo.room_content }
		</td>
		<td>
			${vo.room_price }
		</td>
		<td>
			${vo.room_people }
		</td>
		<td>
			${vo.room_spa }
		</td>
		<td>
			${vo.room_cooking }
		</td>
		<td>
			${vo.room_smoking }
		</td>
		<td>
			${vo.room_stock }
		</td>
		<td>
			${vo.room_image }
		</td>
	</tr>
	</c:forEach>
</table>
<br>
<div class="div1">
<input class="btn btn-warning" type="button"  value="뒤로가기" onclick="history.back(-1);">
<button class="btn btn-warning" value="" onclick="index_go(this.form)">메인페이지</button>
</div>
</form>
	<br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br>
</body>
<%@ include file="../footer.jspf" %>
</html>