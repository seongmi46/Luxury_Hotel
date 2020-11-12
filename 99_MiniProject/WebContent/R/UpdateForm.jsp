<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보 수정</title>
<%@ include file="../include.jspf" %>
<script>
   function update_ok(frm) {
      
      // 하나라도 입력 안하면 안되게 체크
      var newpwd = frm.pwd.value;
      var newphone = frm.phone.value;
      var newemail = frm.email.value;
      
      if (newpwd == "") {
         alert("비밀번호를 입력하세요");
         frm.pwd.focus();
         return false;
      } else if (newphone == "") {
         alert("전화번호를 입력하세요");
         frm.phone.focus();
         return false;
      } else if (newemail == "") {
         alert("이메일을 입력하세요");
         frm.email.focus();
         return false;
      } else {
         alert("입력완료");
      }
      
      frm.action="MyPage?type=updateok";
      frm.submit();   
   }
   function mypage_go() {
      location.href="../S/reserveMain.jsp";
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
<h6>[${cvo.cust_name }님] 개인정보 수정</h6>
   <table class="table table-bordered bordertable">
      <tbody>
      <tr>
         <th>이름</th>
         <td>${cvo.cust_name }</td>
      </tr>
      <tr>
         <th>아이디</th>
         <td>${cvo.cust_id }</td>
      </tr>
         <tr>
            <th>비밀번호</th>
            <td>
               <input type="password" name="pwd" title="비밀번호변경" placeholder="최대 4자리">
            </td>
         </tr>
         <tr>
            <th>전화번호</th>
            <td>
               <input type="text" name="phone" title="전화번호변경" placeholder="전화번호를 입력하세요">
            </td>
         </tr>
         <tr>
            <th>이메일</th>
            <td>
               <input type="text" name="email" title="이메일변경" placeholder="이메일을 입력하세요">
            </td>
         </tr>
         
      </tbody>
      <tfoot>
         <tr>
            <td colspan="2">
               <input type="button"class="btn btn-warning"  value="수  정" onclick="update_ok(this.form)">
               <input type="reset" class="btn btn-warning" value="다시작성">
               <input type="button" class="btn btn-warning" value="메인으로 이동" onclick="mypage_go()">
               <input type="hidden" name="cust_no" value="${cvo.cust_no }">
            </td>
         </tr>
      </tfoot>
   </table>
</form>


</div>
</div>
</body>
<%@ include file="../footer.jspf" %>
</html>