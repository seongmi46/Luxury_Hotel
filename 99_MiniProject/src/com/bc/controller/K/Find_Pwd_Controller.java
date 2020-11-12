package com.bc.controller.K;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

	@WebServlet("/K/userFindPwd")
	public class Find_Pwd_Controller extends HttpServlet {
		private static final long serialVersionUID = 1L;
	       
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String cust_id = request.getParameter("cust_id");
			String cust_name = request.getParameter("cust_name");
			String cust_phone = request.getParameter("cust_phone");
			System.out.println("=========" + cust_id);
			System.out.println("=========" + cust_name);
			System.out.println("=========" + cust_phone);
			String pwd = DAO.userFindPwd(cust_id, cust_name, cust_phone);
			
			System.out.println("pwd: " +  pwd);

			request.setAttribute("pwd", pwd);
			request.setAttribute("cust_name", cust_name);
			
			request.getRequestDispatcher("find_firm_pwd.jsp").forward(request, response);
			

			
			
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			doGet(request, response);
		}
	}