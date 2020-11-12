<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 문의내역 상세보기</title>
<%@ include file="../include.jspf" %>
<script>

	function modify_go(frm) {
		frm.action = "MyPage?type=modifyqna";
		frm.submit();
	}
	function delete_go(frm) {   
		var isDelete = confirm("정말 삭제하시겠습니까?");
		if (isDelete) {
			alert("게시글이 삭제되었습니다.");
			frm.action = "MyPage?type=deleteqna";
			frm.submit();  // 삭제처리 진행
		} else {
			history.back();  // 삭제 취소하고 이전페이지로 이동
		}
	}
	function list_go(frm) {  
		frm.action = "MyPage?type=select&opt=2";
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
.width20{width:20%;}
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
				<th class="width20">글번호</th>
				<td>${qvo.qna_no }</td>
			</tr>
			<tr>
				<th class="width20">문의유형</th>
				<td>${qvo.qna_type }</td>
			</tr>
			<tr>
				<th class="width20">작성자</th>
				<td>${qvo.cust_name }</td>
			</tr>
			<tr>
				<th class="width20">글제목</th>
				<td>${qvo.qna_title }</td>
			</tr>
			<tr>
				<th class="width20">글내용</th>
				<td>${qvo.qna_content }</td>
			</tr>
		</tbody>
		
	</table>
</form>

<%-- 게시글에 작성된 댓글 표시 영역 --%>
		<form method="post">
<c:if test="${empty qalist }">
	<p>작성된 댓글이 없습니다.</p>
</c:if>
<c:if test="${not empty qalist }">
	<c:forEach var="qalist" items="${qalist }">
			<table class="table table-bordered bordertable">
				<tr>
					<th class="width20">[관리자]</th>
					<td colspan="2">
						${qalist.ans_content }
						<input type="hidden" name="qna_no" value="${qvo.qna_no }">
					</td>
				</tr>
				</table>
	</c:forEach>
</c:if>		
<table>
			<tr>
				<td colspan="5">
					<input type="button" class="btn btn-warning" value="문의글 수정" onclick="modify_go(this.form)">
					<input type="button" class="btn btn-warning" value="문의글 삭제" onclick="delete_go(this.form)">
					<input type="button" class="btn btn-warning" value="목 록 으 로" onclick="list_go(this.form)">
					<input type="hidden" value="cPage2" onclick="${cPage2 }">
					<input type="hidden" name="qna_no" value="${qvo.qna_no }">
				</td>
			</tr>
		</table>
	
			
			
			
		
		</form>
	
	
	


</div>
</div>
</body>
<%@ include file="../footer.jspf" %>
</html>















