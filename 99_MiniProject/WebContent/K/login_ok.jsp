<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//0. 한글처리를 위한 encoding 타입 설정
	request.setCharacterEncoding("UTF-8");

	//1. 파라미터 값 추출
%>
	<jsp:useBean id="vo" class="com.bc.controller.K.CustomerVO"/>
	<jsp:setProperty property="*" name="vo"/>
<%	
	System.out.println("> vo : " + vo);	
	System.out.println("> page vo : " + pageContext.getAttribute("vo"));	

	//2. SqlSession 객체 생성 및 DB작업
	SqlSession ss = DBService.getFactory().openSession(true);
	
	try {
		ss.update("mini_project.update", vo);
		
		//3. 화면전환 - 정상처리
		response.sendRedirect("main.jsp?cust_no=" + vo.getCust_no());
	} catch(Exception e) {
		e.printStackTrace();
		//3. 화면전환 - 예외발생
%>
		<script>

			history.go(-2); //상세화면으로 이동
		</script>
<%		
	} finally {
		ss.close();
	}
%>















