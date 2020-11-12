<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력화면</title>
 <%@ include file="../include.jspf" %>
 
<script>

	function write_ok(frm) {
		
		// 하나라도 입력 안하면 안되게 체크
		var title = frm.title.value;
		var content = frm.content.value;
		var phone = frm.phone.value;
		var pwd = frm.pwd.value;
		
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
		} else if (pwd == "") {
			alert("비밀번호를 입력하세요");
			frm.pwd.focus();
			return false;
		} else {
			alert("입력완료");
		}
		frm.action = "MyPage?type=qnawriteok";
		frm.submit();
	}



</script> 
 
 
 
 
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
			<caption>문의글 수정</caption>
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
						<input type="text" name="title" title="제목">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="content" rows="8" cols="50" title="내용"></textarea>
					</td>
				</tr>
				<tr>
					<th>연락받으실 전화번호</th>
					<td>
						<input type="text" name="phone" title="번호">${qvo.cust_phone }
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="pwd" title="비밀번호">
					</td>
				</tr>
			</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" class="btn btn-warning" value="저 장" onclick="write_ok(this.form)">
					<input type="reset" class="btn btn-warning" value="취 소">
					<input type="hidden" name="cust_no" value="${cvo.cust_no }">
				</td>
			</tr>
		</tfoot>
	</table>
	
	</form>
</div>
</div>
	<br><br>
</body>
<%@ include file="../footer.jspf" %>
</html>





