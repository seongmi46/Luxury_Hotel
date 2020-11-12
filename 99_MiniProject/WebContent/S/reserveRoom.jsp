<!-- 조건 입력 후 원하는 방 선택하는 메뉴 -->


<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.bc.hotel.dao.HotelDAO"%>
<%@page import="com.bc.mybatis.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.hotel.vo.HotelVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
System.out.println("id: " + session.getAttribute("cust_id"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>룸선택화면</title>
<%@ include file="../include.jspf" %>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$().ready(function(){
		if('${spa}' != "") {
			var roomOption1 = '${spa}';
			console.log("spa : " + "-" + '${spa}' + "-");
			$("input:checkbox[id='spa']").prop("checked", true);
		}
		if('${cooking}' != "") {
			var roomOption2 = '${cooking}';
			console.log("cooking : " + cooking);
			$("input:checkbox[id='cooking']").prop("checked", true);
		}
		if('${smoking}' != "") {
			var roomOption3 = '${smoking}';
			console.log("smoking : " + smoking);
			$("input:checkbox[id='smoking']").prop("checked", true);
		}
		
	});
	
	option(frm){
		frm.acrion = 
		frm.submit();
	}
</script>	
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
	width: auto;
	height: auto;
}
.checkform { 
	box-sizing: border-box;
	width: 200px;
	height: 200px;
	margin: 20px auto;
	border-radius: 20px;
	background-color: #e9e9e9;
}
.pagination {
	justify-content: center;
}
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
</head>
<header>
<%@ include file="../navBar.jspf" %>
</header>


<body>
<br><br><br>


<section class="section pb-0"  >
  <div class="container">
   
    <div class="row check-availabilty" id="next">
      <div class="block-32" data-aos="fade-up">

          <div class="row">
          	<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
              <label for="hotel" class="font-weight-bold text-black">호텔선택</label>
              <div class="field-icon-wrap">
                <div class="icon"><span class="icon-calendar"></span></div>
                <input type="hidden" name="listValue" id="listValue">
                <input type="text" class="form-control" id="select" name="hotelName" value="${hotelName }">
              </div>
            </div>
            <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
              <label for="inDate" class="font-weight-bold text-black">Check In</label>
              <div class="field-icon-wrap">
                <div class="icon"><span class="icon-calendar"></span></div>
                <input type="text" id="checkin_date" class="form-control" name="inDate" value="${inDate }">
              </div>
            </div>
            <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
              <label for="outDate" class="font-weight-bold text-black">Check Out</label>
              <div class="field-icon-wrap">
                <div class="icon"><span class="icon-calendar"></span></div>
                <input type="text" id="checkout_date" class="form-control" name="outDate" value="${outDate }">
              </div>
            </div>
            <div class="col-md-6 mb-3 mb-md-0 col-lg-3">
              <div class="row">
                <div class="col-md-6 mb-3 mb-md-0">
                  <label for="people" class="font-weight-bold text-black">people</label>
                  <div class="field-icon-wrap">
                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                    <input type="text" id="people" class="form-control" name="people" value="${people }">
                  </div>
                </div>
              </div>
            </div>
            
          </div>
      </div>


    </div>
  </div>
</section>



<hr>

<div class="container">
	<table class="table table-bordered">
		<tr>
			<td><p><img class="rounded" src="../images/${hotelInfo.hotel_image }.jpg" alt="${hotelInfo.hotel_name }" width="300px" height="200px"></p>
					${hotelInfo.hotel_name }</td>
			<td>${hotelInfo.hotel_addr }</td>
			<td>${hotelInfo.hotel_tel }</td>
			
		</tr>
	</table>
	<hr>
</div>
	

	

<div class="container-fluid row">
<div class="col-md-2 col-lg-2 checkform">
<form action="controller?type=main" method="post">
	<br><br>
	<div class="form-check">
        <input type="checkbox" class="form-check-input" id="spa" name="spa" value="1">스파<br>
        <input type="checkbox" class="form-check-input" id="cooking" name="cooking" value="1">취사<br>
        <input type="checkbox" class="form-check-input" id="smoking" name="smoking" value="1">흡연객실<br>
		<button class="btn btn-outline-secondary" name="optionChk" onclick="option()">검색</button>
    </div>
    </form>
</div>




<div class="col-md-9 col-lg-9">
<form action="controller?type=reservePage&cPage=${pvo.nowPage }" method="post">

	<table class="table table-bordered bordertable">
		<tbody>
			<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="5">
						<h2>현재 등록된 게시글이 없습니다.</h2>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="vo" items="${roomList }">
				<tr>
					<td><p><img src="../images/${vo.room_image }.jpg" alt="${vo.room_name}" width="350px" height="300px"></p>
						${vo.room_name }</td>
					<td><p><img src="../images/${vo.room_content }.jpg" alt="${vo.room_name}" width="500px" height="350px"></p></td>
					<td><p>
					<c:if test="${vo.room_spa=='0'}">스파:X</c:if>
					<c:if test="${vo.room_spa=='1'}">스파:O</c:if>
					<c:if test="${vo.room_cooking==0}">취사:X</c:if>
					<c:if test="${vo.room_cooking==1}">취사:O</c:if>
					<c:if test="${vo.room_smoking==0}">흡연:X</c:if>
					<c:if test="${vo.room_smoking==1}">흡연:O</c:if>
					<!-- 스파: ${vo.room_spa}<br>
					취사: ${vo.room_cooking}<br>
					흡연: ${vo.room_smoking }-->
					</p></td>
					<td><p>${vo.room_price}</p></td>
					<td><p><input type="radio" name="room_no" value="${vo.room_no }"></p></td>
				</tr>
				</c:forEach>
			</c:otherwise>
			</c:choose>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4">
				<ul class="pagination">
					<c:choose>
						<c:when test="${pvo.beginPage == 1 }">
							<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="controller?type=main&cPage=${pvo.beginPage - 1 }">Previous</a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
						<c:choose>
							<c:when test="${pageNo == pvo.nowPage }">
								<li class="page-item active"><a class="page-link" href="#">${pageNo }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="controller?type=main&cPage=${pageNo }&spa=${spa}&cooking=${cooking}&smoking=${smoking}">${pageNo }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
			
				    <c:choose>
						<c:when test="${pvo.endPage >= pvo.totalPage }">
							<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="controller?type=main&cPage=${pvo.endPage + 1 }">다음</a></li>
						</c:otherwise>
					</c:choose>
			  	</ul>
				</td>
				<td><button type="submit" class="btn btn-warning right">선택</button></td>
			</tr>
		</tfoot>  
	</table>

	<input type="hidden" name="inDate" value="${inDate }">
	<input type="hidden" name="outDate" value="${outDate }">
	<input type="hidden" name="people" value="${people }">
	<input type="hidden" name="hotel_no" value="${hotelInfo.hotel_no }">
	<input type="hidden" name="hotel_name" value="${hotelInfo.hotel_name }">
	</form>
</div>
</div>
	


	<!-- 
	<table class="table">
		<c:forEach var="vo" items="${list }">
		<tr>
			<td><p><img src="images/${vo.room_image }.jpg" alt="${vo.room_name}" width="300px" height="200px"></p>
					${vo.room_name }</td>
			<td>${vo.room_content}</td>
			<td>${vo.room_price}</td>
			<td><input type="radio" name="room_no" value="${vo.room_no }"></td>
		</tr>
		</c:forEach>
	</table>
	<input type="submit" value="예약하기">
	
	<input type="hidden" name="inDate" value="${inDate }">
	<input type="hidden" name="outDate" value="${outDate }">
	<input type="hidden" name="people" value="${people }">
	<input type="hidden" name="hotel_no" value="${hotelInfo.hotel_no }">
	<input type="hidden" name="hotel_name" value="${hotelInfo.hotel_name }">
	 -->

</body>
<%@ include file="../footer.jspf" %>
</html>