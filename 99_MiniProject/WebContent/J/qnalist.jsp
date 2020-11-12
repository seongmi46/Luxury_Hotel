<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의보기</title>
<%@ include file="../include.jspf" %>
<script>
	function index_go(frm) {
		frm.action = "index.jsp";
		frm.submit();
	}

   function send_data() {
      var firstForm = document.forms[0];
      //게시글 항목에 값 유무 체크
      for (var i=0; i<firstForm.elements.length; i++) {
         if (firstForm.elements[i].value.trim() == "") {
            alert(firstForm.elements[i].title + " 입력하세요");
            firstForm.elements[i].focus();
            return;
         }
      }
   }
</script>
</head>
<header>
<%@ include file="../navBar.jspf" %>
</header>
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
   .div {
      text-align: center;
   }
   .div1{
      text-align: right;
   }
   .div2{
      text-align: center;
   }
 		/***** 페이지 표시 부분 스타일(시작) ****/
	.paging li {
		float: left;
		margin-right: 8px;
	}
	.paging li a {
		text-decoration: none;
		display: block;
		padding: 3px 7px;
		border: 1px solid gray;
		font-weight: bold;
		color: black;
	}
	.paging .disable {
		border: 1px solid silver;
		padding: 3px 7px;
		color: silver;
	}
	.paging .now {
		border: 1px solid gray;
		padding: 3px 7px;
		background-color: gray;
		color: black;
	}
	.paging li a:hover {
		background-color: ;
		color: white;
	}
	.pagination {
 		justify-content: center;
	}
	/***** 페이지 표시 부분 스타일(끝) ****/
</style>
<body>
<br>
   <div class="div">
   <h1>관리자 페이지</h1>
   </div>
   <h3>Q&A 문의</h3>
   <hr>
   <div class="div1">
      <form action="qnasearch" method="post">
         <select name="idx">
            <option value="4">문의번호</option>
            <option value="5">회원번호</option>
         </select>
         <input type="text" name="keyword">
         <input type="submit" value="조회" onclick="send_data()">
      </form>
   </div>
   <br>
   <form action="selectone">
   <table class="table table-bordered">
   <thead>
   <tr>
      <th class="th1">문의번호</th>
      <th class="th2">회원번호</th>
      <th class="th3">제목</th>
      <th class="th6">질문타입</th>
   </tr>
   </thead>
   <tbody>
   <c:forEach var="vo" items="${list5 }"> 
   <tr>
      <td>
         ${vo.qna_no }
      </td>
      <td>
         ${vo.cust_no }
      </td>
      <td>
         <a href="selectone?qna_no=${vo.qna_no}">${vo.qna_title }</a>
      </td>
      <td>
         ${vo.qna_type }
      </td>
   </tr>
   <input type="hidden" value="${vo.qna_no}" name="qna_no">
   </c:forEach>
   </tbody>
</table>
	<div class="paging">
		<ol class="pagination pagination-sm">
			<c:choose><%--[이전으로]에 대한 사용여부처리 --%>
				<%--사용불가(disable) 또는 안보이게(hidden) : 첫번째 블록인 경우 --%>
				<c:when test="${pvo.beginPage == 1}">
					<li class="disable"> << </li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="qnalist?cPage=${pvo.beginPage - 1 }"> << </a>
					</li>
				</c:otherwise>
			</c:choose>
			<%-- 블록내에 표시할 페이지 태그 작성(시작페이지~끝페이지) --%>	
			<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
			<c:choose>
				<c:when test="${pageNo == pvo.nowPage }">
					<li class="now">${pageNo }</li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="qnalist?cPage=${pageNo }">${pageNo }</a>
					</li>
				</c:otherwise>
			</c:choose>
			</c:forEach>
				
			<c:choose><%--[다음으로]에 대한 사용여부처리 --%>
				<%--사용불가(disable) 또는 안보이게(hidden) : 마지막 블록인 경우
					endPage가 전체페이지수와 같거나 큰 경우 --%>
				<c:when test="${pvo.endPage >= pvo.totalPage }">
					<li class="disable"> >> </li>
				</c:when>
				<c:otherwise>
					<li><a href="qnalist?cPage=${pvo.endPage + 1 }"> >> </a></li>
				</c:otherwise>
			</c:choose>
		</ol>
	</div>	
<br>
<div class="div2">
<input type="button" class="btn btn-warning" value="뒤로가기" onclick="history.back(-1);">
<button class="btn btn-warning" value="" onclick="index_go(this.form)">메인페이지</button>
</div>
</form>
   <br><br><br><br><br><br><br><br><br><br>
   <br><br><br><br><br><br><br><br><br><br>
</body>
<%@ include file="../footer.jspf" %>
</html>