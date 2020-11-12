<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔조회</title>
<%@ include file="../include.jspf" %>
<script>
	function hotel_go(frm) {
		frm.action = "hotel.jsp";
		frm.submit();
	}
</script>
</head>
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
	.div {
		text-align: center;
	}
	.div1{
		text-align: right;
	}
	.div2{
		text-align: center;
	}
	.paging{
		left: 42.5%;
		position: absolute;
		margin: auto;
		list-style: none;
	}
		/***** 페이지 표시 부분 스타일(시작) ****/
	.paging li {
		float: left;
		margin-right: 8px;
	}
	.paging li a {
		text-decoration: none;
		display: block;
		padding: 3px 7px;
		border: 1px solid gray;
		font-weight: bold;
		color: black;
	}
	.paging .disable {
		border: 1px solid silver;
		padding: 3px 7px;
		color: silver;
	}
	.paging .now {
		border: 1px solid gray;
		padding: 3px 7px;
		background-color: gray;
		color: black;
	}
	.paging li a:hover {
		background-color: ;
		color: white;
	}
	.pagination {
   		justify-content: center;
}
	/***** 페이지 표시 부분 스타일(끝) ****/
</style>
<header>
<%@ include file="../navBar.jspf" %>
</header>
<body>
<br>
	<div class="div">
	<h1>관리자 페이지</h1>
	</div>
	<h2>호텔 조회</h2>
	<hr>
	<form>
	<table class="table table-bordered">
	<tr>
		<th class="th1">호텔번호</th>
		<th class="th2">호텔이름</th>
		<th class="th3">호텔전화번호</th>
		<th class="th4">호텔주소</th>
		<th class="th5">호텔사진</th>
	</tr>
	<c:forEach var="vo" items="${list3 }"> 
	<tr>
		<td>
			${vo.hotel_no }
		</td>
		<td>
			${vo.hotel_name }
		</td>
		<td>
			${vo.hotel_tel }
		</td>
		<td>
			${vo.hotel_addr }
		</td>
		<td>
			${vo.hotel_image }
		</td>
	</tr>
	</c:forEach>
</table>
<br>
	<div class="paging">
			<ol class="pagination pagination-sm">
			<c:choose><%--[이전으로]에 대한 사용여부처리 --%>
				<%--사용불가(disable) 또는 안보이게(hidden) : 첫번째 블록인 경우 --%>
				<c:when test="${pvo.beginPage == 1}">
					<li class="disable"> << </li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="hotellist?cPage=${pvo.beginPage - 1 }"> << </a>
					</li>
				</c:otherwise>
			</c:choose>
			<%-- 블록내에 표시할 페이지 태그 작성(시작페이지~끝페이지) --%>	
			<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
			<c:choose>
				<c:when test="${pageNo == pvo.nowPage }">
					<li class="now">${pageNo }</li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="hotellist?cPage=${pageNo }">${pageNo }</a>
					</li>
				</c:otherwise>
			</c:choose>
			</c:forEach>
				
			<c:choose><%--[다음으로]에 대한 사용여부처리 --%>
				<%--사용불가(disable) 또는 안보이게(hidden) : 마지막 블록인 경우
					endPage가 전체페이지수와 같거나 큰 경우 --%>
				<c:when test="${pvo.endPage >= pvo.totalPage }">
					<li class="disable"> >> </li>
				</c:when>
				<c:otherwise>
					<li><a href="hotellist?cPage=${pvo.endPage + 1 }"> >> </a></li>
				</c:otherwise>
			</c:choose>
			</ol>
	</div>
<br><br>
<div class="div2">
<input type="button" class="btn btn-warning" value="뒤로가기" onclick="history.back(-1);">
<input type="button" class="btn btn-warning" value="호텔 관리" onclick="hotel_go(this.form)">
</div>
</form>

	<br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br>
</body>
<%@ include file="../footer.jspf" %>
</html>