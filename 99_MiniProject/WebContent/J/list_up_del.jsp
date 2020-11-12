<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.bc.model.DAO"%>
<%@page import="com.bc.model.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cust_no = request.getParameter("cust_no");
	CustomerVO cust = DAO.modify(cust_no);
	pageContext.setAttribute("cust", cust);
	
	SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyymmdd");
	String cust_birth = cust.getCust_birth().substring(0,10);
	pageContext.setAttribute("cust_birth", cust_birth);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정/탈퇴</title>
<%@ include file="../include.jspf" %>
<script>
	function index_go(frm) {
		frm.action = "index.jsp";
		frm.submit();
	}
</script>
</head>
<style>
	.div {
		font-family: '나눔고딕',NanumGothic,'맑은고딕',MalgunGothic,'돋움',Dotum,Helvetica,sans-serif;
		font-size: 12px;      
		border:1px solid #ededed !important;
		font-weight: normal;          
		line-height: 19px;
		color:#20232;
		padding-top: 9px !important;
		padding-bottom: 7px !important;
		vertical-align:middle;
		text-align: center;
		margin: auto;
	}
	.div0 {
		text-align: center;
	}
	.div1 {
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
	<h3>회원정보 수정/탈퇴</h3>
	<div class="div0">
	<form action="listupdate" method="post">
		<p>회원번호 : <input type="text" name="cust_no" value="${cust.cust_no }" readonly></p>
		<p>이름 : <input type="text" name="cust_name" value="${cust.cust_name }"></p>
		<p>아이디 : <input type="text" name="cust_id" value="${cust.cust_id }" readonly></p>
		<p>비밀번호 : <input type="text" name="cust_pwd" value="${cust.cust_pwd }"></p>
		<p>전화번호 : <input type="text" name="cust_phone" value="${cust.cust_phone }"></p>
		<p>이메일 : <input type="text" name="cust_email" value="${cust.cust_email }"></p>
		<p>탈퇴여부 : <input type="text" name="cust_exist" value="${cust.cust_exist }" readonly></p>
		<p>생일 : <input type="text" name="cust_birth" value="${cust_birth }"></p>
<br>
<div class="div1">
<input type="button" class="btn btn-warning" value="뒤로가기" onclick="history.back(-1);">
<button class="btn btn-warning" value="">회원정보수정</button>
</div>
</form>
</div>

<form action="listdelete" method="post">
<div class="div1">
<input type="hidden" value="${cust.cust_no }" name="cust_no">
<input class="btn btn-warning" type="submit" value="회원탈퇴">
<button class="btn btn-warning" value="" onclick="index_go(this.form)">메인페이지로</button>
</div>
</form>
</body>
<%@ include file="../footer.jspf" %>
</html>