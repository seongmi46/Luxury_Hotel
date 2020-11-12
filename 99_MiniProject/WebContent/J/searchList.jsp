<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이름/번호로 회원 조회</title>
<%@ include file="../include.jspf" %>
<script>
	function index_go(frm) {
		frm.action = "index.jsp";
		frm.submit();
	}
	function modify(frm) {
		frm.action = "list_up_del.jsp";
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
	.div {
		text-align: center;
	}
	.div1{
		text-align: center;
	}
	.update{
		margin-right: 50px;
	}
	
</style>
<body>
<br>
	<div class="div">
	<h1>관리자 페이지</h1>
	</div>
	<h3>이름/번호로 회원 조회</h3>
	<hr>
	<form>
	<table class="table table-bordered">
	<tr>
		<th class="th0">선택</th>
		<th class="th1">회원번호</th>
		<th class="th2">이름</th>
		<th class="th3">아이디</th>
		<th class="th4">비밀번호</th>
		<th class="th5">전화번호</th>
		<th class="th6">이메일</th>
		<th class="th7">탈퇴여부</th>
		<th class="th8">생일</th>
	</tr>
	<c:choose>
		<c:when test="${empty list }">
			<tr>
				<td colspan="9">
					<h2>찾으시는 회원이 없습니다.</h2>
				</td>
			</tr>
		</c:when>
	<c:otherwise>
		
	<c:forEach var="vo" items="${list }"> 
	<tr>
		<td>
			<input type="radio" name="cust_no" value="${vo.cust_no}">
		</td>
		<td>
			${vo.cust_no }
		</td>
		<td>
		 	${vo.cust_name }
		</td>
		<td>
			${vo.cust_id }
		</td>
		<td>
			${vo.cust_pwd }
		</td>
		<td>
			${vo.cust_phone }
		</td>
		<td>
			${vo.cust_email }
		</td>
		<td>
			${vo.cust_exist }
		</td>
		<td>
			${vo.cust_birth }
		</td>
	</tr>
	</c:forEach>
	</c:otherwise>
	</c:choose>
</table>
<br>
<div class="div1">
<input type="button" class="btn btn-warning" value="뒤로가기" onclick="history.back(-1);">
<button class="btn btn-warning" value="" onclick="modify(this.form)">정보수정/탈퇴</button>
<button class="btn btn-warning" value="" onclick="index_go(this.form)">메인페이지로</button>
</div>
</form>
	<br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br>
</body>
<%@ include file="../footer.jspf" %>
</html>