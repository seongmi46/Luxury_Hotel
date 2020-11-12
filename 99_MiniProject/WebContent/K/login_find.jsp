<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>아이디 비밀번호 찾기</title>
<%@ include file="../include.jspf" %>

 <style>
	.center {
		display: inline-block;
		text-align: center;
		width:100%;
		height: 800px;
	}
	table {
		margin-left: auto;
		margin-right: auto;
	}
</style>
<script>
function userFindId(frm){
	var cust_name = frm.cust_name.value;
	var cust_phone = frm.cust_phone.value;
	if(cust_name == ""){
		alert("이름를 입력하세요.");
		frm.cust_name.value ="";
		frm.cust_name.focus();
		return false;
	} 
	if(cust_phone == ""){
		alert("휴대폰번호를 입력하세요.");
		frm.cust_phone.value ="";
		frm.cust_phone.focus();
		return false;
	}else if( cust_phone.length != 11 ) { 
        alert("휴대폰번호는 11자리로 입력 가능합니다.");
        return false;
    } 
	if(isNaN(cust_phone)){
		alert("휴대폰번호는 - 제외한 숫자만 입력해주세요.");
		return false;
	}
	//frm.action="userFindId";
	url = "userFindId?cust_name=" + cust_name + "&cust_phone=" + cust_phone;
	wind = open(url, "find_firm", "toolbar=no, location=no,status = no, scrollbars=no, resizable=no, width=500, height=300");
	//frm.submit();
	//console.log(frm.success.value);

}

function userFindPwd(frm){
	var id1 = frm.cust_id1.value;	
	var name1 = frm.cust_name1.value;
	var phone1 = frm.cust_phone1.value;
	console.log("id1: " + id1);
	console.log("name1: " + name1);
	console.log("phone1: " + phone1);
	
	if(id1== ""){
		alert("아이디를 입력하세요.");
		id1 ="";
		frm.cust_id1.focus();
		return false;
	}  else if( (id1 < "0" || id1 > "9") && (id1 < "A" || id1 > "Z") && (id1 < "a" || id1 > "z") ) { 
        alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
        return false;
    }
	if(name1 == ""){
		alert("이름를 입력하세요.");
		name="";
		frm.cust_name1.focus();
		return false;
	}  

	if(phone1 == ""){
		alert("휴대폰번호를 입력하세요.");
		frm.cust_phone1.value ="";
		frm.cust_phone1.focus();
		return false;
	}else if( phone1.length != 11 ) { 
           alert("휴대폰번호는 11자리로 입력 가능합니다.");
           return false;
       } 
	if(isNaN(phone1)){
		alert("휴대폰번호는 - 제외한 숫자만 입력해주세요.");
		return false;
	}
	//frm.action="userFindPwd";
		url = "userFindPwd?cust_name=" + name1 + "&cust_phone=" + phone1 + "&cust_id=" + id1;
	wind = open(url, "find_firm", "toolbar=no, location=no,status = no, scrollbars=no, resizable=no, width=300, height=200");
	frm.submit();
	//console.log(frm.success.value);
}
</script>
</head>
<header>
<%@ include file="../navBar.jspf" %>
</header>
<body>
<div class="container">
<div class="center">
<br><br>
		<!-- 아이디 찾기 -->
		<form>
				<h2>아이디  찾기</h2>
				<hr>
				<p>아이디를 잊어버리셨나요?<br>아래 입력사항에 가입하실때 작성하신 정보를 입력해주세요.</p>
					
					<table>
						<tr>
							<td id="title">이름</td>
							<td>
								<input type="text" name="cust_name" maxlength="30" placeholder="성명 입력">
							</td>
						</tr>
						<tr>
							<td id="title">휴대전화</td>
							<td>
								<input type="text" name="cust_phone" maxlength="30" placeholder="-제외하고 입력" />
							</td>
						</tr>
					</table>
					<input type="button"  class="btn btn-warning" value="아이디 찾기"  onclick="userFindId(this.form)">
		<br><br><br><br>
				<!-- 비밀번호 찾기 -->
				<h2>비밀번호 찾기</h2>
					<hr>
				<p>비밀번호를 잊어버리셨나요?<br>아래 입력사항에 가입하실때 작성하신 정보를 입력해주세요</p>
				<br>
			<table>
					<tr>
						<td id="title">아이디 </td>
						<td>
							<input type="text" name="cust_id1" placeholder="아이디 입력">
						</td>
					</tr>
					<tr>
						<td id="title">이름</td>
						<td>
							<input type="text" name="cust_name1" maxlength="50" placeholder="성명 입력">
						</td>
					</tr>
					<tr>
						<td id="title">휴대전화</td>
						<td>
							<input type="text" name="cust_phone1" placeholder="-제외하고 입력" />
						</td>
					</tr>
				</table>	
				<input type="button"  class="btn btn-warning"  value="비밀번호 찾기"  onclick="userFindPwd(this.form)">
		</form>		
</div>
</div>			


<%@ include file="../footer.jspf" %>		
</body>

</html>