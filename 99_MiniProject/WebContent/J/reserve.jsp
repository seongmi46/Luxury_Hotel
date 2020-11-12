<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약내역조회</title>
<%@ include file="../include.jspf" %>
<script>
	function index_go(frm) {
		frm.action = "index.jsp";
		frm.submit();
	}
	function send_data() {
		var firstForm = document.forms[0];
		//게시글 항목에 값 유무 체크
		for (var i=0; i<firstForm.elements.length; i++) {
			if (firstForm.elements[i].value.trim() == "") {
				alert(firstForm.elements[i].title + " 입력하세요");
				firstForm.elements[i].focus();
				return;
			}
		}
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
	.div{
		text-align: center;
	}
	.div1{
		text-align: right;
	}
	.div2{
		text-align: center;
	}
	.paging{
		left: 42%;
		margin: auto;
		position: absolute;
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
	<h3>예약내역조회</h3>
	<hr>
	<div class="div1">
		<form action="searchRS" method="post">
			<select name="idx">
				<option value="2">예약번호</option>
				<option value="3">회원번호</option>
			</select>
			<input type="text" name="keyword">
			<input type="submit" value="조회" onclick="send_data()">
		</form>
	</div>
	<br>
<form>
	<table class="table table-bordered">
		<tr>
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
			<th class="th12">숙박인원</th>
		</tr>
		<c:choose>
			<c:when test="${empty list2 }">
				<tr>
					<td colspan="11">
						<h2>잘못된 번호 입니다. 다시 조회 하세요.</h2>
					</td>
				</tr>
			</c:when>
		<c:otherwise>
		<c:forEach var="vo" items="${list2 }">
		<tr>
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
			<td>
				${vo.rev_people }
			</td>
		</tr>
		</c:forEach>
		</c:otherwise>
		</c:choose>
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
						<a href="reserve?cPage=${pvo.beginPage - 1 }"> << </a>
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
						<a href="reserve?cPage=${pageNo }">${pageNo }</a>
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
					<li><a href="reserve?cPage=${pvo.endPage + 1 }"> >> </a></li>
				</c:otherwise>
			</c:choose>
			</ol>
	</div>
<br><br>
<div class="div2">
<input type="button" class="btn btn-warning" value="뒤로가기" onclick="history.back(-1);">
<button class="btn btn-warning" value="" onclick="index_go(this.form)">메인페이지</button>
</div>
</form>


	<br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br>
</body>
<%@ include file="../footer.jspf" %>
</html>