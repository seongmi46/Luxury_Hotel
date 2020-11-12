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
<title>내 예약 목록 보여주기 (제목 클릭하면 상세보기)</title>
<%@ include file="../include.jspf" %>
<style>

.pagination {
	justify-content: center;
}
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
.no {width: 10%;}
	
	/***** 페이지 표시 부분 스타일(시작) ****/
	.paging { list-style: none; }
	.paging li {
		float: left;
		margin-right: 8px;
	}
	.paging li a {
		text-decoration: none;
		display: block;
		padding: 3px 7px;
		border: 1px solid #00B3DC;
		font-weight: bold;
		color: black;
	}
	.paging .disable {
		border: 1px solid silver;
		padding: 3px 7px;
		color: silver;
	}
	.paging .now {
		border: 1px solid #ff4aa5;
		padding: 3px 7px;
		background-color: #ff4aa5;
		color: white;
	}
	.paging li a:hover {
		background-color: #00B3DC;
		color: white;
	}
	/***** 페이지 표시 부분 스타일(끝) ****/
</style>
</head>
<header>
<%@ include file="../navBar.jspf" %>
</header>
<body>
<br><br><br>
<div class="container">
<div class="center">
	
	
	<table>
		<thead>
			<tr class="table table-bordered bordertable">
				<th class="no">예약번호</th>
				<th class="cname">예약자명</th>
				<th class="hname">호텔이름</th>
				<th class="regdate">입실날짜</th>
				<th class="regdate">퇴실날짜</th>
				<th class="etc">비고</th> <!--예약완료/예약취소 -->
			</tr>
		</thead>	
		<tbody>
			<c:choose>
			<c:when test="${empty rlist }">
				<tr class="table table-bordered bordertable">
					<td colspan="6">
						<h2>예약목록이 없습니다.</h2>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="vo" items="${rlist }">
				<tr class="table table-bordered bordertable">
					<td>${vo.rev_no }</td>
					<td>${vo.rev_name }</td>
					<td>
						<a href="MyPage?type=bookingdetail&rev_no=${vo.rev_no }">${vo.hotel_name }</a> <%-- 제목 클릭하면 상세내용 --%>
					</td>
					<td>${vo.rev_in.substring(0,10) }</td>
					<td>${vo.rev_out.substring(0,10) }</td>
					<c:if test="${vo.rev_exist == 1}">
						<td>예약완료</td>
					</c:if>
					<c:if test="${vo.rev_exist == 0}">
						<td>예약취소</td>
					</c:if>
				</tr>
				
				</c:forEach>
			</c:otherwise>
			</c:choose>

		</tbody>
		<tfoot>
			<tr class="table table-bordered bordertable">
				<td colspan="6">
					<ul class="pagination">
						<c:choose>
							<c:when test="${pvo.beginPage == 1 }">
								<li class="disable">이전</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="MyPage?type=select&opt=1&cPage=${pvo.beginPage - 1}">이전</a> 
								</li>
							</c:otherwise>
						</c:choose>
						<%-- 블록 내에 표시할 페이지태그 작성 (시작페이지 ~ 끝페이지) --%>
						<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
						<c:choose>
							<c:when test="${pageNo == pvo.nowPage }">
								<li class="now">${pageNo }</li>
							</c:when>
							<c:otherwise>
								<li><a href="MyPage?type=select&opt=1&cPage=${pageNo}">${pageNo }</a></li>
							</c:otherwise>
							
						</c:choose>
						
						</c:forEach>
						
						<%-- [다음]에 대한 사용여부 처리 --%>
						<c:choose>
							<%-- 사용불가 --%>
							<c:when test="${pvo.endPage >= pvo.totalPage }">
								<li class="disabled">다음</li>
							</c:when>
							<%-- 사용가능 --%>
							<c:otherwise>
								<li>
									<a href="MyPage?type=select&opt=1&cPage=${pvo.endPage + 1 }">다음</a>
								</li>
							</c:otherwise>
						</c:choose>
				
						
					</ul>
				</td>
			</tr>
		
		</tfoot>
	
	</table>
	
	</div>
</div>
</body>
<%@ include file="../footer.jspf" %>
</html>

























