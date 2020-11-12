package com.bc.hotelcontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.vo.RoomVO;

@WebServlet("/J/hmsearch")
public class HotelRoomSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hotel_no = request.getParameter("hotel_no");
		

			List<RoomVO> hotelroom = DAO.getSearch2(hotel_no);
			System.out.println(">> 동적검색결과 hotelroom : " + hotelroom);
			
			
			//동적검색 결과 응답페이지로 전달
			request.setAttribute("hotelroom", hotelroom);
			
			request.getRequestDispatcher("hotelroomsearch.jsp")
					.forward(request, response);
		}
		

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}








