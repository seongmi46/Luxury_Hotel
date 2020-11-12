<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 메인</title>
<%@ include file="../include.jspf" %>
<script>
	function index_go(frm) {
		frm.action = "index.jsp";
		frm.submit();
	}
	function hotellist(frm) {
		//frm.action = "list.jsp"; //예전방식 jsp 직접 호출
		frm.action = "hotellist"; 
		frm.submit();
	}
	function hotelroomlist(frm) {
		frm.action = "hotelroomlist";
		frm.submit();
	}
	function hotelinsert(frm) {
		//frm.action = "reserve.jsp";
		frm.action = "hotelinsert.jsp";
		frm.submit();
	}
	function hotelroominsert(frm) {
		frm.action = "hotelroominsert";
		frm.submit();
	}
</script>
</head>
<style>
	.div{
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
	h1{
		text-decoration: overline;
		text-decoration: underline;
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
<header>
<%@ include file="../navBar.jspf" %>
</header>
<body>
<br>
	<div class="div">
	<h1>관리자 페이지</h1>
	</div>
	<h3>호텔 관리</h3>
	<div class="div111">
	<form method="post">
		<button class="btn custdiv" id="cust" onclick="hotellist(this.form)">
			<p class="manager"> 호텔조회</p>
		</button>
		
		<button class="btn custdiv" id="reserve" onclick="hotelroomlist(this.form)">
			<p class="manager">호텔 룸 조회</p>	
		</button>
		<br>
		<button class="btn custdiv" id="hotel" onclick="index_go(this.form)">
			<p class="manager"> 메인페이지 </p>
		</button>
	</form>
	</div>
	<br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br>
</body>
<%@ include file="../footer.jspf" %>
</html>