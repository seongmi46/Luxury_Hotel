<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--자바빈 클래스 import --%>
    <%@ page import="com.bc.controller.K.CustomerVO" %>
    <%-- DAO import --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입완료</title>
 <%@ include file="../include.jspf" %>
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
<!-- css파일 분리 -->
 <script>
  function main(){
	  location.href="../S/reserveMain.jsp";
  }
  function login(){
	  location.href="login.jsp";
  }
 </script>
 <link href='../../css/join_style.css' rel='stylesheet' style='text/css'/>
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
	<!-- joinForm.jsp에서 입력한 정보를 넘겨 받아 처리한다. -->
<%
	//한글 깨짐 방지를 위한 인코딩 처리
	request.setCharacterEncoding("UTF-8");
%>
<%--자바빈 관련 액션태그 사용 --%>
<jsp:useBean id="customerVO" class="com.bc.controller.K.CustomerVO"/>
<jsp:setProperty property="*" name="customerVO"/>
<%

%>
<div class="container">
<div class="center">
<br><br>
	<form>
		<br><br>
		<b><font size="15" color="lightgray"><%=customerVO.getCust_name() %>님 호텔 일원이 되신 것을 환영합니다.</font></b>
		<br><br>
		<p>회원가입 정보를 확인하세요.</p>
		<br><br>	
		<table>
			<tr>
				<td id="title">아이디</td>
				<td><%=customerVO.getCust_id() %></td>
			</tr>
			<tr>
				<td id="title">비밀번호</td>
				<td><%=customerVO.getCust_pwd() %></td>
			</tr>
			<tr>
				<td id="title">이름</td>
				<td><%=customerVO.getCust_name() %></td>
			</tr>
			<tr>
				<td id="title">생일</td>
				<td><%=customerVO.getCust_birth() %></td>
			</tr>
			<tr>
				<td id = "title">이메일</td>
				<td><%=customerVO.getCust_email() %></td>
			</tr>
			<tr>
				<td id="title">휴대전화</td>
				<td><%=customerVO.getCust_phone() %></td>
			</tr>
		</table>
	<br><br>
		<input type="button" class="btn btn-warning" value="메인" onclick="main()">
		<input type="button" class="btn btn-warning" value="로그인" onclick="login()">
	</form>
</div>
</div>
	<br><br>
</body>
<%@ include file="../footer.jspf" %>
</html>












