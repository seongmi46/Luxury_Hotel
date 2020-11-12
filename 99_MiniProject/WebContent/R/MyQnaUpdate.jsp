<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 수정</title>
<%@ include file="../include.jspf" %>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	function modify_qna(frm) {
		
		// 하나라도 입력 안하면 안되게 체크
		var title = frm.title.value;
		var content = frm.content.value;
		var phone = frm.phone.value;
		
		if (title == "") {
			alert("제목을 입력하세요");
			frm.title.focus();
			return false;
		} else if (content == "") {
			alert("내용을 입력하세요");
			frm.content.focus();
			return false;
		} else if (phone == "") {
			alert("연락받으실 전화번호를 입력하세요");
			frm.phone.focus();
			return false;
		} else {
			alert("입력완료");
		}
		frm.action = "MyPage?type=qnaupdate";
		frm.submit();
	}
	function list_go() {
		location.href="MyQnaList.jsp";
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
			<h6>문의글 수정</h6>
		<table class="table table-bordered bordertable">
			<tbody>
				<tr>
					<th>문의유형</th>
					<td>
						<select name="qnaopt" onchange="selectqna(this.form)">
							<option value="0">호텔가입</option>
							<option value="1">호텔이용</option>
							<option value="2">호텔객실</option>
							<option value="3">칭찬해요</option>
							<option value="4">건의사항</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="title" title="제목수정" placeholder="${qvo.qna_title }" value="${qvo.qna_title }">
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						<input type="text" name="name" title="작성자" readonly="readonly" placeholder="${qvo.cust_name }" value="${qvo.cust_name }">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="content" rows="8" cols="50" title="내용수정">${qvo.qna_content }</textarea>
					</td>
				</tr>
				<tr>
					<th>연락받으실 전화번호</th>
					<td>
						<input type="text" name="phone" title="번호수정">${qvo.cust_phone }
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" class="btn btn-warning" value="수정" onclick="modify_qna(this.form)">
						<input type="reset" class="btn btn-warning" value="초기화">
						<input type="button" class="btn btn-warning" value="목록" onclick="list_go(this.form)">
						<input type="hidden" name="qna_no" value="${qvo.qna_no }">
					
					</td>
				</tr>
			
			</tfoot>
		
		</table>
	
	</form>


</div>
</div>

<br><br><br>
</body>
<%@ include file="../footer.jspf" %>
</html>