<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디찾기</title>
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

<%
/* String id = (String)request.getAttribute("id"); */
String cust_name = (String)request.getAttribute("cust_name");
String id = (String)request.getAttribute("id");
if ( request.getAttribute("id") != null) { 
%>

<div class="container">
<div class="center">
<center>
<br><br>
	<p><%=cust_name %>님의 아이디는</p>
	<p><%=id %>  </p>
	<p>입니다.</p>	
<input type="button" class="btn btn-warning" value="창닫기" onclick="self.close()">
</center>
</div>
</div>
<%
} else  { 
%>

<div class="container">
<div class="center">
<br><br>
<center>
	<p>검색된 아이디가 없습니다</p>
<input type="button" class="btn btn-warning" value="창닫기" onclick="self.close()">
</center>
</div>
</div>
<%
}
%>
</body>
</html>