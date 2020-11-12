package com.bc.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.vo.CustomerVO;
@WebServlet("/J/listupdate")
public class ListUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cust_no = Integer.parseInt(request.getParameter("cust_no"));
		int cust_exist = Integer.parseInt(request.getParameter("cust_exist"));
		String cust_name = request.getParameter("cust_name");
		String cust_id = request.getParameter("cust_id");
		String cust_pwd = request.getParameter("cust_pwd");
		String cust_phone = request.getParameter("cust_phone");
		String cust_email = request.getParameter("cust_email");
		String cust_birth = request.getParameter("cust_birth");
		
		CustomerVO vo = new CustomerVO(cust_no, cust_exist, cust_name, cust_id, cust_pwd,
				cust_phone, cust_email, cust_birth);
		
		DAO.listupdate(vo);
	
		
		request.getRequestDispatcher("listupdateok.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
