package com.bc.qnacontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.vo.Paging;
import com.bc.model.vo.QnA_VO;

@WebServlet("/J/qnasearch")
public class QnaSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("idx");
		String keyword = request.getParameter("keyword");
		
		// 단순 페이지 전환인지 DB데이터 조회처리를 해야 하는지 결정
		if (keyword == null || keyword.equals("")) {
			//search.jsp 페이지로 응답처리(페이지 이동)
			request.getRequestDispatcher("qnasearch.jsp").forward(request, response);
		} else { // DB데이터 조회처리 후 결과페이지 이동
			List<QnA_VO> qnalist = DAO.getQnasearchtest(idx, keyword);
			System.out.println(">> 동적검색결과 qnalist : " + qnalist);
			
			//동적검색 형태 확인
			String title = "";
			switch (idx) {
				case "4" : title = "문의번호"; break;
				case "5" : title = "회원번호"; break;
			}
			
			//동적검색 결과 응답페이지로 전달
			request.setAttribute("qnalist", qnalist);
			request.setAttribute("title", title);
			
			//페이지 전환(searchList.jsp 페이지에 위임)
			request.getRequestDispatcher("qnasearch.jsp")
					.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}








