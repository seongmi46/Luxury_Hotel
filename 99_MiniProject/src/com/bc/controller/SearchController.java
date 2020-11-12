package com.bc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.vo.CustomerVO;

@WebServlet("/J/search")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("idx");
		String keyword = request.getParameter("keyword");
		
		// 단순 페이지 전환인지 DB데이터 조회처리를 해야 하는지 결정
		if (keyword == null || keyword.equals("")) {
			//search.jsp 페이지로 응답처리(페이지 이동)
			request.getRequestDispatcher("searchList.jsp").forward(request, response);
		} else { // DB데이터 조회처리 후 결과페이지 이동
			List<CustomerVO> list = DAO.getSearch(idx, keyword);
			System.out.println(">> 동적검색결과 list : " + list);
			
			//동적검색 형태 확인
			String title = "";
			switch (idx) {
				case "0" : title = "이름"; break;
				case "1" : title = "회원번호"; break;
			}
			
			//동적검색 결과 응답페이지로 전달
			request.setAttribute("list", list);
			request.setAttribute("title", title);
			
			//페이지 전환(searchList.jsp 페이지에 위임)
			request.getRequestDispatcher("searchList.jsp")
					.forward(request, response);
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}








