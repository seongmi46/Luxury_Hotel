package com.bc.rscontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.vo.ReserveVO;
@WebServlet("/J/reserveupdate")
public class ReserveUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rev_no = Integer.parseInt(request.getParameter("rev_no"));
		int hotel_no = Integer.parseInt(request.getParameter("hotel_no"));
		int cust_no = Integer.parseInt(request.getParameter("cust_no"));
		int rev_room_no = Integer.parseInt(request.getParameter("rev_room_no"));
		int rev_price = Integer.parseInt(request.getParameter("rev_price"));
		int rev_exist = Integer.parseInt(request.getParameter("rev_exist"));
		int rev_people = Integer.parseInt(request.getParameter("rev_people"));
		String rev_in = request.getParameter("rev_in");
		String rev_out = request.getParameter("rev_out");
		String rev_name = request.getParameter("rev_name");
		String rev_email = request.getParameter("rev_email");
		String rev_phone = request.getParameter("rev_phone");
		
		ReserveVO vo = new ReserveVO(rev_no, hotel_no, cust_no, rev_room_no, rev_price,
				rev_exist, rev_people, rev_in, rev_out, rev_name, rev_email, rev_phone);
		
		DAO.reserveupdate(vo);
	
		
		request.getRequestDispatcher("reserveupdateok.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
