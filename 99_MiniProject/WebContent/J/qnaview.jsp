<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% request.getAttribute("qna_vo"); %>
<% request.getAttribute("ans_view"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna상세보기 및 답변</title>
<%@ include file="../include.jspf" %>
</head>
<style>
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
<script>
	function list_go() {
		location.href="qnalist"
	}
	function insert_ok(){
		alert('답글이 저장 되었습니다.')
	}
	function delete_ok(){
		var isDelete = confirm("정말 삭제하시겠습니까?");
		if (isDelete) {
			frm.submit(); //삭제처리 진행
			alert('답글이 삭제 되었습니다.')
		} else {
			history.back(); //삭제취소하고 이전페이지로 이동
		}
		
	}
</script>
<header>
<%@ include file="../navBar.jspf" %>
</header>
<body>
<br>
	<div class="bbs">
	<%-- 게시글 내용 표시 --%>
	<form method="post" name="frm">
	<h3>상세보기</h3>
	<table class="table table-bordered">
		<tbody>
			<tr>
				<th>문의번호 :</th>
				<td>${qna_vo.qna_no}</td>
			</tr>
			<tr>
				<th>회원번호 :</th>
				<td>${qna_vo.cust_no}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${qna_vo.qna_title}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${qna_vo.qna_content}</td>
			</tr>	
			<tr>
				<th>비밀번호</th>
				<td>${qna_vo.qna_pwd}</td>
			</tr>
			<tr>
				<th>문의타입</th>
				<td>${qna_vo.qna_type}</td>
			</tr>
			<tr>
				<th>회원전화번호</th>
				<td>${qna_vo.cust_phone}</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="목록" onclick="list_go()">
				</td>
			</tr>
		</tfoot>
	</table>
</form>
</div>
<hr>	
<%-- 게시글에 대한 댓글 작성 영역 --%>
<form action="qna_ans_write" method="post">
<p>답변 작성</p>
	<p>내용 : <textarea name="ans_content" rows="4" cols="55"></textarea></p>
	<input type="submit" value="답변저장" onclick="insert_ok()">
	<input type="hidden" name="qna_no" value="${qna_vo.qna_no}">
	<input type="hidden" name="cust_no" value="${qna_vo.cust_no }">
</form>
<hr>
<%-- 게시글에 작성된 댓글 표시영역 --%> 
<div class="comment">
	<p>관리자 답변 내역</p>
	<c:forEach var="ans_view" items="${ans_view }">
	<form action="qna_ans_del" method="post">
	<table>
	<tr>
		<td>
			<input type="hidden" name="ans_no" value="${ans_view.ans_no }">
			<input type="hidden" name="qna_no" value="${ans_view.qna_no }">
			<p>답변 :<textarea name="ans_content" rows="3" cols="70">${ans_view.ans_content }</textarea></p>
		</td>
		<td>
			<input type="submit" value="답변삭제" onclick="delete_ok()">
			<%-- 삭제처리후 게시글 상세페이지로 이동시 --%>		
			<input type="hidden" name="ans_no" value="${ans_view.ans_no }">
			<input type="hidden" name="qna_no" value="${ans_view.qna_no }">
		</td>
	</tr>
	</table>
	</form>
	</c:forEach>
</div>
</body>
<%@ include file="../footer.jspf" %>
</html>
