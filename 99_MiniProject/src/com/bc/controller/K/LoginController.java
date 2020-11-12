package com.bc.controller.K;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/K/logcontroller")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("login controller ");
		String cust_id = request.getParameter("cust_id");
		System.out.println("cust_id" + cust_id);
		String cust_pwd = request.getParameter("cust_pwd");
		System.out.println("cust_pwd" + cust_pwd);
		String pathall = request.getParameter("nowPage");
		System.out.println("cust_id : " + cust_id + ", cust_pwd : " + cust_pwd);
		System.out.println(pathall);
		//String[] path = pathall.split("/");

		int user = DAO.loginUsers(cust_id, cust_pwd);
		System.out.println("user : " + user);
		

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(user != 0) {
			request.setAttribute("cust_id", cust_id);
			request.getSession().setAttribute("cust_id", cust_id);
			if("manager".equals(cust_id)) {
				response.sendRedirect("../J/index.jsp");
			}else {
				response.sendRedirect("../S/reserveMain.jsp");
			}
		}else {
			
			System.out.println("실패");
			//String pa = path[path.length - 1] + "?logtry=tried";
			//System.out.println(pa);
			//response.sendRedirect(pa);
			out.println("<script>alert('아이디나 비밀번호를 잘못 입력하였습니다.'); history.back();</script>");
			out.flush();
		}	
		
		out.close();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
