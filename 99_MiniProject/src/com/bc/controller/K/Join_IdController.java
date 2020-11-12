package com.bc.controller.K;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/K/idCheck")
public class Join_IdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cust_id = request.getParameter("cust_id");
		System.out.println("=========" + cust_id);
		int result = DAO.idCheck(cust_id);
		System.out.println("result: " + result);
		request.setAttribute("result", result);
		
		request.getRequestDispatcher("joinform.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
