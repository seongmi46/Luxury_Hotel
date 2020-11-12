package com.bc.hotelcontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.vo.HotelVO;
@WebServlet("/J/hotelinsert")
public class HotelInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hotel_name = request.getParameter("hotel_name");
		String hotel_tel = request.getParameter("hotel_tel");
		String hotel_addr = request.getParameter("hotel_addr");
		String hotel_image = request.getParameter("hotel_image");
		
		HotelVO vo = new HotelVO(hotel_name, hotel_tel, hotel_addr, hotel_image);
		
		DAO.hotelinsert(vo);
		
		request.getRequestDispatcher("hotelinsertok.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
