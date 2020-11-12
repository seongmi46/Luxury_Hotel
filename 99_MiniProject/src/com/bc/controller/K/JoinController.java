package com.bc.controller.K;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/K/JoinController")
public class JoinController extends HttpServlet{
   private static final long serialVersionUID = 1L;

   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println(">> FrontController.doGet()");

	    String cust_id = request.getParameter("cust_id");
		String cust_pwd = request.getParameter("cust_pwd");
		String cust_phone = request.getParameter("cust_phone");
		String cust_name = request.getParameter("cust_name");
		String cust_email = request.getParameter("cust_email");
		String cust_birth = request.getParameter("cust_birth");
		
		System.out.println(">>>>>> " + cust_id + " " + cust_pwd + " " + cust_phone + " " + cust_name + " " + cust_email + " " + cust_birth);
		CustomerVO vo = new CustomerVO();
		vo.setCust_id(cust_id);
		vo.setCust_pwd(cust_pwd);
		vo.setCust_phone(cust_phone);
		vo.setCust_name(cust_name);
		vo.setCust_email(cust_email);
		vo.setCust_birth(cust_birth);
		System.out.println(vo);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		//result = HotelDAO.reserveInsert(rvo);
	
		
		int check = DAO.idCheck(cust_id);
		if(check == 1) {
			System.out.println("중복");
			out.println("<script>alert('중복된 아이디는 가입이 불가합니다.'); history.back();</script>");
			out.flush();
			out.close();
			System.out.println("중복11");
		} else if(check == 0) {
			int result = DAO.joingo(vo);
			System.out.println("result : " + result); 	
			request.getRequestDispatcher("JoinPro.jsp").forward(request, response);
			
		}
		
		//response.sendRedirect("JoinPro.jsp");

   }

   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      doGet(request, response);
   }



}