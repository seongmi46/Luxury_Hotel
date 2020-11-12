<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 문의내역 조회</title>
<%@ include file="../include.jspf" %>
<script>
	function write_go(frm) {
		frm.action = "MyPage?type=qnawrite";
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
.pagination {
	justify-content: center;
}
.no{width:10%;}
.type{width:15%;}
.name{width:20%;}
.bold{font-weight: bold;}
	
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

	
	<table class="table table-bordered bordertable">
		<thead>
			<tr class="bold">
				<th class="no">글번호</th>
				<th class="type">문의유형</th>
				<th class="name">작성자</th>
				<th>글제목</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
			<c:when test="${empty qlist2 }">
				<tr>
					<td colspan="4">
						<h2>문의내역이 없습니다.</h2>	
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="vo" items="${qlist2 }">
				<tr>
					<td>${vo.qna_no }</td>
					<td>${vo.qna_type }</td>
					<td>${vo.cust_name }</td>
					<td>
						<a href="MyPage?type=qnadetail&qna_no=${vo.qna_no }">${vo.qna_title }</a>
					</td>
				</tr>
				
				</c:forEach>
			
			</c:otherwise>
			
			</c:choose>
		
		
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4">
					<ul class="pagination">
						<c:choose>
							<c:when test="${pvo2.beginPage == 1 }">
								<li class="disabled">이전</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="MyPage?type=select&opt=2&cPage2=${pvo2.beginPage - 1 }">이전</a>
								</li>
							</c:otherwise>
						</c:choose>
						<c:forEach var="pageNo2" begin="${pvo2.beginPage }" end="${pvo2.endPage }">
						<c:choose>
							<c:when test="${pageNo2 == pvo2.nowPage }">
								<li class="now">${pageNo2 }</li>
							</c:when>
							<c:otherwise>
								<li><a href="MyPage?type=select&opt=2&cPage2=${pageNo2}">${pageNo2 }</a></li>
							</c:otherwise>
							
						</c:choose>
						
						</c:forEach>
						
						<%-- [다음]에 대한 사용여부 처리 --%>
						<c:choose>
							<%-- 사용불가 --%>
							<c:when test="${pvo2.endPage >= pvo2.totalPage }">
								<li class="disabled">다음</li>
							</c:when>
							<%-- 사용가능 --%>
							<c:otherwise>
								<li>
									<a href="MyPage?type=select&opt=2&cPage2=${pvo2.endPage + 1 }">다음</a>
								</li>
							</c:otherwise>
						</c:choose>
					
					</ul>
				</td>
				
			</tr>
		
		</tfoot>
		
		
	</table>
	<form method="post">
		<input type="button" class="btn btn-warning" value="글쓰기" onclick="write_go(this.form)">
	</form>

	
</div>
</div>
<br><br><br>
</body>
<%@ include file="../footer.jspf" %>
</html>