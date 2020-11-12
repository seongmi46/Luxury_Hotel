<%@page import="com.bc.controller.K.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@ include file="../include.jspf" %>
<% String logtry = request.getParameter("logtry"); %>
<%
	request.setCharacterEncoding("EUC-KR");
	String cust_id = (String) session.getAttribute("cust_id"); //세션에서 idkey를 가져온다
%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	function join_go(){
		console.log("join_go");
		location.href="join.jsp";
	}
	function findIdorPwd(){
		console.log("dd");
		location.href="login_find.jsp";
	}
	function login_go(frm) {
		var id = frm.cust_id.value;
		var pwd = frm.cust_pwd.value;
		if(id == ""){
			alert("아이디를 입력해주세요.");
			frm.idd.value = "";
			frm.idd.focus();
			return false;
		}
		if(pwd == "") {
			alert("비밀번호를 입력해 주세요.");
			frm.pwd.value ="";
			frm.pwd.focus();
			return false;
		}
		frm.nowPage.value = location.pathname;
		frm.action="logcontroller";
		frm.submit();
		//location.href="../S/reserveMain.jsp";
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
</style>
</head>
<header>
<%@ include file="../navBar.jspf" %>
</header>
<body>

<div class="container">
<div class="center">
<br><br>
	<h2>로그인</h2>
	<hr>
	<p><a href="../S/reserveMain.jsp">홈페이지로 이동</a></p>
<%
	if (cust_id != null) {
%>


	<b><%=cust_id%></b>님 환영합니다.<br /> 제한된 기능을 사용 할 수가 있습니다.<br /> 
	<a href="logout.jsp">로그아웃</a>&nbsp; <a href="../R/UpdateForm.jsp">내정보조회</a>

<%
	} else {
%>
<form method="post">
	<table>
		<tbody>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="cust_id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="cust_pwd"></td>
			</tr>

		</tbody>
		
	</table>
	<br>
	<button type="button" class="btn btn-warning" onclick="login_go(this.form)">로 그 인</button>
	<button type="button" class="btn btn-warning" onclick="findIdorPwd()">아이디/비밀번호 찾기</button><!-- location=windows.open('login/login_find.jsp' -->
	<button type="button" class="btn btn-warning" onclick="join_go()">회원가입</button>
	
	<input type="hidden" name="cust_no" value="${customerVO.getCust_no() }">
	<input type="hidden" name="nowPage" value="">
	
	</form>
		<%
			}
		%>
</div>
</div>
</body>
<%@ include file="../footer.jspf" %>
</html>








