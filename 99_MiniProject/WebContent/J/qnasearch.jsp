<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문/회원 번호로 조회</title>
<%@ include file="../include.jspf" %>
<script>
	function index_go(frm) {
		frm.action = "index.jsp";
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
		text-align: center;
	}
</style>
<header>
<%@ include file="../navBar.jspf" %>
</header>
<body>
<br>
	<div class="div">
	<h1>관리자 페이지</h1>
	</div>
	<h3>문의/회원 번호로 조회</h3>
	<hr>
	<form>
	<table class="table table-bordered">
	<tr>
		<th class="th1">문의번호</th>
		<th class="th2">회원번호</th>
		<th class="th3">제목</th>
		<th class="th6">질문타입</th>
	</tr>
	<c:choose>
		<c:when test="${empty qnalist }">
			<tr>
				<td colspan="4">
					<h3>잘못된 번호 입니다. 다시 조회 하세요.</h3>
				</td>
			</tr>
		</c:when>
	<c:otherwise>	
	<c:forEach var="vo" items="${qnalist }"> 
	<tr>
		<td>
			${vo.qna_no }
		</td>
		<td>
		 	${vo.cust_no }
		</td>
		<td>
			<a href="selectone?qna_no=${vo.qna_no}">${vo.qna_title }</a>
		</td>
		<td>
			${vo.qna_type }
		</td>
	</tr>
	</c:forEach>
	</c:otherwise>
	</c:choose>
</table>
<br>
<div class="div1">
<input type="button" class="btn btn-warning" value="뒤로가기" onclick="history.back(-1);">
<button class="btn btn-warning" value="" onclick="index_go(this.form)">메인페이지</button>
</div>
</form>
	<br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br>
</body>
<%@ include file="../footer.jspf" %>
</html>