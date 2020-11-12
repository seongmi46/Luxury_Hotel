<!-- 메인화면 -->



<%@page import="com.bc.hotel.dao.HotelDAO"%>
<%@page import="com.bc.hotel.vo.HotelVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	session.removeAttribute("hotelName");
	session.removeAttribute("inDate");
	session.removeAttribute("outDate");
	session.removeAttribute("people");
	//호텔목록가져오기
	List<HotelVO> list = HotelDAO.getHotelList();
	pageContext.setAttribute("list", list);
	System.out.println("id: " + session.getAttribute("cust_id"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>예약검색화면</title>
 <%@ include file="../include.jspf" %>
<style>
	* { margin:0;
		padding: 0;}
	#popup { 
		display:none;
		position:fixed;
		width:100%;
		height:100%;
		background:#999;
		z-index:1; 
		}
	#popmenu{
		position:absolute;
		left:50%;
		top:50%;
		transform:translate(-50%, -50%);
		width:300px;
		height:500px;
		text-align:center;
		background:#fff;
		z-index:2;
	}
	#popmenu p {
		margin-top:80px;}
</style>

<script>
	$(document).ready(function(){
		$("#select").click(function(){
			$("#popup").fadeIn();
		});
		$(".exit").click(function(){
			var hotel = $("input[name='hotel']:checked").val();
			$("#select").val(hotel);
			$("#popup").fadeOut();
		});
	});
	
	function valueCheck(frm){
		var id = "${sessionScope.cust_id}";
		if(id == ""){
			alert("로그인을 하고 이용하여주세요.");
			return false;
		} 

		var hotelName = frm.hotelName.value;
		var inDate = frm.inDate.value;
		var outDate = frm.outDate.value;
		var people = frm.people.value;
		
		var now = new Date();
	    var year = now.getFullYear();
	    var month = now.getMonth() + 1;
	    var date = now.getDate();

	    if((month + "").length < 2){
	        month = "0" + month;
	    }
	    if((date + "").length < 2){
	        date = "0" + date;
	    }
	    var today = ""+year + month + date;
		
		
		
		if(hotelName == ""){
			alert("호텔을 선택해주세요.");
			frm.hotelName.value = "";
			return false;
		}
		if(inDate == ""){
			alert("입실 일자를 입력해주세요.");
			frm.inDate.value = "";
			frm.inDate.focus();
			return false;
		}
		if(inDate < today){
			alert("입실일은 오늘 이후의 날짜만 가능합니다.");
			frm.inDate.value = "";
			frm.inDate.focus();
			return false;
		}
		if(outDate == ""){
			alert("퇴실 일자를 입력해주세요.");
			frm.outDate.value = "";
			frm.outDate.focus();
			return false;
		}
		if(outDate <= inDate){
			alert("퇴실일은 입실 일자 이후로 입력해주세요.");
			frm.outDate.value = "";
			frm.outDate.focus();
			return false;
		}
		frm.submit();
	}
	
	
</script>
</head>
<header>
<%@ include file="../navBar.jspf" %>
</header>
<body>
 	<div id="popup">
		<div id="popmenu">
		<p>
			<ol>
		 	<c:forEach var="vo" items="${list }">
				<li><input type="radio" name="hotel" value="${vo.hotel_name }">&nbsp;&nbsp;&nbsp;${vo.hotel_name }</li>
			</c:forEach>
			</ol>
			<div class="exit">선택완료</div>
		</p>
		</div>
	</div>
  	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="carousel-item active" style="background-image: url('https://q-cf.bstatic.com/images/hotel/max1024x768/251/251019186.jpg')">
        </div>
        <div class="carousel-item" style="background-image: url('http://www.shillahotels.com/images/en/hub/sub/jejuMainImg.jpg')">
        </div>
        <div class="carousel-item" style="background-image: url('https://t1.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/56y8/image/CN6s3V3KMegFi7oUG5S_iaq9ZEM.jpg')">
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>



<section class="section pb-0"  >
  <div class="container">
   
    <div class="row check-availabilty" id="next">
      <div class="block-32" data-aos="fade-up" data-aos-offset="-200">

        <form action="controller?type=main" method="post">
          <div class="row">
          	<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
              <label for="hotel" class="font-weight-bold text-black">호텔선택</label>
              <div class="field-icon-wrap">
                <div class="icon"><span class="icon-calendar"></span></div>
                <input type="hidden" name="listValue" id="listValue">
                <input type="text" class="form-control" id="select" name="hotelName" placeholder="호텔을 선택하세요">
              </div>
            </div>
            <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
              <label for="inDate" class="font-weight-bold text-black">Check In</label>
              <div class="field-icon-wrap">
                <div class="icon"><span class="icon-calendar"></span></div>
                <input type="text" id="checkin_date" class="form-control" name="inDate" placeholder="체크인날짜">
              </div>
            </div>
            <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
              <label for="outDate" class="font-weight-bold text-black">Check Out</label>
              <div class="field-icon-wrap">
                <div class="icon"><span class="icon-calendar"></span></div>
                <input type="text" id="checkout_date" class="form-control" name="outDate" placeholder="체크아웃날짜">
              </div>
            </div>
            <div class="col-md-6 mb-3 mb-md-0 col-lg-3">
              <div class="row">
                <div class="col-md-6 mb-3 mb-md-0">
                  <label for="people" class="font-weight-bold text-black">people</label>
                  <div class="field-icon-wrap">
                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                    <select name="people" id="adults" class="form-control">
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                      <option value="4">4</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-6 col-lg-3 align-self-end">
             		 <button type="button" class="btn btn-outline-warning text-black" onclick="valueCheck(this.form)">검색</button>
           		</div>
              </div>
            </div>
            
          </div>
        </form>
      </div>


    </div>
  </div>
</section>




<!-- Bootstrap core JavaScript -->
<!--  <script src="/vendor/jquery/jquery.min.js"></script> -->
<!--  <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
</body>
<%@ include file="../footer.jspf" %>
</html>