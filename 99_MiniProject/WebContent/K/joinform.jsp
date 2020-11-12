<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"></script>
<script>
function goMain(){
	console.log("goMain");
	location.href="../S/reserveMain.jsp";
}
	var success = false;
	function sel_one(frm){
		
		var id = frm.cust_id.value;
		if(id == ""){
			alert("아이디를 입력하세요.");
			frm.id.value ="";
			frm.id.focus();
			return false;
		}  else if( (id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z") ) { 
            alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
            return false;
        }
		url = "confirmId.jsp?id=" + id;
		open(url, "confirmId", "toolbar=no, location=no,status = no, scrollbars=no, resizable=no, width=500, height=400");
		console.log(frm.success.value);
		

	}
	function joinInssert(frm){
		var id = frm.cust_id.value;
		var pwd = frm.cust_pwd.value;		
		var pwdch = frm.cust_pwdcheck.value;
		var email = frm.cust_email.value;
		var phone = frm.cust_phone.value;
		var name = frm.cust_name.value;
		var birth = frm.cust_birth.value;
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

		if(id == ""){
			alert("아이디를 입력하세요.");
			frm.id.value ="";
			frm.id.focus();
			return false;
		}  else if( (id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z") ) { 
            alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
            return false;
        }

		if(pwd == "") {
			alert("비밀번호를 입력해 주세요.");
			frm.pwd.value ="";
			frm.pwd.focus();
			return false;
        }
		if(pwdch == "") {
			alert("비밀번호를 확인해 주세요.");
			frm.pwdch.value="";
			frm.pwdch.focus();
			return false;
        }
		if(pwd != pwdch){
			alert("비밀번호가 일치하지 않습니다. \n다시 입력하여주세요.");
			frm.password.value = "";
			frm.passwordcheck.value = "";
			frm.password.focus();
			return false;
		}
		if(name == "") {
			alert("이름을 입력해주세요.");
			frm.name.value = "";
			frm.name.focus();
			return false;
		}  
		if(birth == "") {
			alert("년월일을 입력해주세요.");
			frm.birth.value = "";
			frm.birth.focus();
			return false;
		} else if( birth.length != 8) { 
            alert("생년월일은 8자리로 입력 가능합니다.");
            frm.birth.value = "";
			frm.birth.focus();
            return false;
        } 

		if(email == "") {
			alert("이메일을 입력해주세요.");
			frm.email.value = "";
			frm.email.focus();
			return false;
		} 
		if(phone == ""){
			alert("휴대폰번호를 입력하세요.");
			frm.phone.value ="";
			frm.phone.focus();
			return false;
		}else if( phone.length != 11 ) { 
            alert("휴대폰번호는 11자리로 입력 가능합니다.");
            return false;
        } 
		if(isNaN(birth)){
			alert("생년월일은 숫자만 입력 가능합니다.");
			frm.birth.value = "";
			frm.birth.focus();
			return false;
		}
		if(isNaN(phone)){
			alert("휴대폰번호는 - 제외한 숫자만 입력해주세요.");
			return false;
		}
		frm.action="JoinController"
		frm.submit();
		
	}
</script>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>회원가입</title>
 <%@ include file="../include.jspf" %>
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
</style>
<header>
<%@ include file="../navBar.jspf" %>
</header>
</head>
<body>
<div class="container">
<div class="center">
<br><br>
		<form method="post" name="userInfo">

			<table>
				<tr>
					<td id="title" name="cust_id">아이디 </td>
					<td>
						<input type="text" name="cust_id" maxlength="20" placeholder="아이디를 입력하시오."></td>
						<td><input type="button" class="btn btn-warning"  value="중복확인"  onclick="sel_one(this.form)">
						<input type="hidden" id="success" value="false">
						<div id="_rgetid"></div>
					</td>
				</tr>
				
				<tr>
					<td id="title">비밀번호</td>
					<td>
						<input type="password" name="cust_pwd" maxlength="12" placeholder="비밀번호를 입력하시오.">
					</td>
					<td></td>
				</tr>
				<tr>
					<td id="title">비밀번호 확인</td>
					<td>
						<input type="password" name="cust_pwdcheck" maxlength="12" placeholder="비밀번호를 한번더 입력하시오.">
					</td>
					<td></td>
				</tr>
				
				<tr>
					<td id="title">이름</td>
					<td>
						<input type="text" name="cust_name" maxlength="30" placeholder="성명을 입력하시오.">
					</td>
					<td></td>
				</tr>
				
				<tr>
					<td id="title">생일</td>
					<td>
						<input type="text" name="cust_birth" maxlength="8" placeholder="년(4자)월(2자)일(2자)" size="20" >
					</td>
					<td></td>
				</tr>
				<tr>
					<td id="title">이메일</td>
					<td><input type="text" name="cust_email" maxlength="50"placeholder="email@exam.com"></td>
				</tr>
				<tr>
					<td id="title">휴대전화</td>
					<td>
						<input type="text" name="cust_phone" placeholder="휴대전화를 입력하시오."/>
					</td>
					<td></td>
				</tr>
			</table>	
			<br>
			<input type="button" class="btn btn-warning"  value="가입완료"  onclick="joinInssert(this.form)">
			 <input type="button" class="btn btn-warning"  value="취소" onclick="goMain(this.form)">
		</form>
	</div>
</div>
	<br><br>
</body>
<%@ include file="../footer.jspf" %>
</html>