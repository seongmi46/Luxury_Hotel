<%@page import="com.bc.controller.K.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복확인</title>
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
<header>
<%@ include file="../navBar.jspf" %>
</header>
</head>
<body>
<form name="form1">
<%
String id = request.getParameter("id");
System.out.println("cust_id   " + id);
int result = DAO.idCheck(id);
System.out.println(result);
if(result != 0){
%>
<div class="container">
<div class="center">
<br><br>
<center>
<br/><br/>
<p>이미 사용중인 ID 입니다.</p>
<input type="button"  class="btn btn-warning"  value="창닫기" onclick="self.close()">
</center>
</div>
</div>
<% } else { %>
<div class="container">
<div class="center">
<br><br>
<center>
<br/><br/>
<p>입력하신 아이디는 사용할 수 있는 ID입니다.</p>
<input type="button"  class="btn btn-warning" value="창닫기" onclick="self.close()">
<input type="hidden" id="success" value="true">
</center>
</div>
</div>
<% } %>
</form>
</body>
</html>