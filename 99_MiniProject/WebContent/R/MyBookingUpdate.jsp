<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약자 정보 수정</title>
<%@ include file="../include.jspf" %>
<script>
	function update_ok(frm) {
		
		// 하나라도 입력 안하면 안되게 체크
		var newname = frm.newname.value;
		var newphone = frm.newphone.value;
		var newemail = frm.newemail.value;
		
		if (newname == "") {
			alert("비밀번호를 입력하세요");
			frm.newname.focus();
			return false;
		} else if (newphone == "") {
			alert("전화번호를 입력하세요");
			frm.newphone.focus();
			return false;
		} else if (newemail == "") {
			alert("이메일을 입력하세요");
			frm.newemail.focus();
			return false;
		} else {
			alert("입력완료");
		}
		
		frm.action="MyPage?type=modifybookingok";  
		frm.submit();	
	}
	
	function mylist_go(frm) {
		frm.action="MyPage?type=select&opt=1";  
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
</style>
</head>
<header>
<%@ include file="../navBar.jspf" %>
</header>
<body>

<br><br><br>
<div class="container">
<div class="center">





<form method="post">
	<table class="table table-bordered bordertable">
		<tbody>
			<tr>
				<th>예약번호</th>
				<td>${rvo.rev_no }</td>
			</tr>
			<tr>
				<th>호텔명</th>
				<td>${rvo.hotel_name }</td>
			</tr>	
			<tr>
				<th>입실날짜</th>
				<td>${rvo.rev_in }</td>
			</tr>
			<tr>
				<th>퇴실날짜</th>
				<td>${rvo.rev_out }</td>
			</tr>
			<tr>
				<th>예약자명</th>
				<td>
					<input type="text" name="newname" title="예약자명 변경" placeholder="숙박하실 고객님의 이름을 입력하세요">
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="newphone" title="전화번호 변경" placeholder="숙박하실 고객님의 전화번호를 입력하세요">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="newemail" title="이메일 변경" placeholder="숙박하실 고객님의 이메일을 입력하세요">
				</td>
			</tr>
			
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" class="btn btn-warning" value="수  정" onclick="update_ok(this.form)">
					<input type="reset" class="btn btn-warning" value="다시작성">
					<input type="button" class="btn btn-warning" value="목  록" onclick="mylist_go(this.form)">
					<input type="hidden" name="rev_no" value="${rvo.rev_no }">
				</td>
			</tr>
		</tfoot>
	
	
	</table>



</form>



</div>
</div>

</body>
<%@ include file="../footer.jspf" %>
</html>