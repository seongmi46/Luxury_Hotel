<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<%@ include file="../include.jspf" %>
<script>
	function all_search(frm) {
		//frm.action = "list.jsp"; //예전방식 jsp 직접 호출
		frm.action = "list"; // list 요청
		frm.submit();
	}
	function reserve_search(frm) {
		//frm.action = "reserve.jsp";
		frm.action = "reserve";
		frm.submit();
	}
	function hotel_search(frm) {
		//frm.action = "reserve.jsp";
		frm.action = "hotel.jsp";
		frm.submit();
	}
	function qna_search(frm) {
		//frm.action = "reserve.jsp";
		frm.action = "qnalist";
		frm.submit();
	}
</script>
</head>
<header>
<%@ include file="../navBar.jspf" %>
</header>
<style>
	h1{
	 text-decoration: overline;
	 text-decoration: underline;
	}
	.div{
		text-align:center;
	}
	.custdiv{
		display: inline-block;
		width: 350px;
		height: 200px;
		margin: 10px;
		position: relative;
		text-align: center;
	}
	.manager{
		line-height: 120px;
		font-size: 2rem;
		font-weight: bolder;
		color: black;
	}
	#cust{
		background-color: #ffd480;
		border-bottom-right-radius: 20px;
	}
	#reserve{
		background-color: #ffeecc;
		border-bottom-right-radius: 20px;	
	}
	#hotel{
		background-color: #ffe6cc;
		border-bottom-right-radius: 20px;
	}
	#QnA{
		background-color: #ffce99;
		border-bottom-right-radius: 20px;
	}
	.div111 {
		text-align: center;
	}
</style>
<body>
<br>
	<div class="div">
	<h1><a href="index.jsp">관리자 페이지</a></h1>
	</div>
	<hr>
	<div class="div111">
	<form method="post">
		<button class="btn custdiv" id="cust" onclick="all_search(this.form)">
			<p class="manager"> 전체회원조회</p>
		</button>
		
		<button class="btn custdiv" id="reserve" onclick="reserve_search(this.form)">
			<p class="manager">예약내역조회</p>	
		</button>
		<br>
		<button class="btn custdiv" id="hotel" onclick="hotel_search(this.form)">
			<p class="manager"> Hotels&Resort조회 </p>
		</button>
		
		<button class="btn custdiv" id="QnA" onclick="qna_search(this.form)">
			<p class="manager" > Q&A조회 </p>
		</button>
	</form>
	</div>

</body>
<%@ include file="../footer.jspf" %>
</html>
