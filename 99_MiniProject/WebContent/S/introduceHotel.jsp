<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔소개페이지</title>
<%@ include file="../include.jspf" %>
</head>
<style>
.divcss{
	font-family: '나눔고딕',NanumGothic,'맑은고딕',MalgunGothic,'돋움',Dotum,Helvetica,sans-serif;
	font-size: 15px;      
	font-weight: normal;  
	padding: 5px; 
	text-align: center;
	background-color: rgb(240, 240, 240);
}
</style>
<header>
<%@ include file="../navBar.jspf" %>
</header>
<body>
<div class="container-fluid row">
<div class="col-md-1 col-lg-1"></div>
<div class="col-md-2 col-lg-2">
<form>
	<br><br>
	<div class="rounded divcss">
        <label id="introduce">개요</label><br>
        <label id="seoul">서울호텔</label><br>
        <label id="jeju">제주호텔</label><br>
        <label id="stay">스테이</label>
    </div>
</form>
</div>


<div class="col-md-8 col-lg-8">
	<br>
	<img src="../images/brandText.jpg" class="img-fluid" id="introduceimg">
	<img src="../images/seoul1.jpg" class="img-fluid" id="seoulimg1">
	<img src="../images/seoul2.jpg" class="img-fluid" id="seoulimg2">
	<img src="../images/jeju1.jpg" class="img-fluid" id="jejuimg1">
	<img src="../images/jeju2.jpg" class="img-fluid" id="jejuimg2">
	<img src="../images/Stay.jpg" class="img-fluid" id="stayimg">
	
</div>
<div class="col-md-1 col-lg-1"></div>
</div>


</body>
 
<script>
    $(document).ready(function(){

            $("#introduceimg").show();
            $("#seoulimg1").hide();
            $("#seoulimg2").hide();
            $("#jejuimg1").hide();
            $("#jejuimg2").hide();
            $("#stayimg").hide();
 
            
            $("#introduce").click(function(){
            	$("#introduceimg").show();
                $("#seoulimg1").hide();
                $("#seoulimg2").hide();
                $("#jejuimg1").hide();
                $("#jejuimg2").hide();
                $("#stayimg").hide();
            });
 
            $("#seoul").click(function(){
                $("#seoulimg1").show();
                $("#seoulimg2").show();
                $("#introduceimg").hide();
                $("#jejuimg1").hide();
                $("#jejuimg2").hide();
                $("#stayimg").hide();
            });
            
            $("#jeju").click(function(){
                $("#jejuimg1").show();
                $("#jejuimg2").show();
                $("#introduceimg").hide();
                $("#seoulimg1").hide();
                $("#seoulimg2").hide();
                $("#stayimg").hide();
            });
            
            $("#stay").click(function(){
                $("#jejuimg1").hide();
                $("#jejuimg2").hide();
                $("#introduceimg").hide();
                $("#seoulimg1").hide();
                $("#seoulimg2").hide();
                $("#stayimg").show();
            });
            
        });
</script>
<%@ include file="../footer.jspf" %>
</html>