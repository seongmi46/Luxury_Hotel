package com.bc.qnacontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.vo.QnA_AnsVO;
import com.bc.model.vo.QnA_VO;
@WebServlet("/J/selectone")
public class QnaOneViewcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> doGet() 시작");
		
		System.out.println(">>> doGet 업무처리 process ~~~~");
		process(request, response);
		
		System.out.println("> doGet() 종료");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	private void process(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		System.out.println(">>> process() 시작");
		System.out.println(">>> DB에서 데이터 가져와서 qnaview.jsp로 전달");
		//1. DB연결하고 데이터 가져오기
		
		String qna_no = request.getParameter("qna_no");
		QnA_VO qna_vo = DAO.Selectone(Integer.parseInt(qna_no));
		
		List<QnA_AnsVO> ans_view = DAO.ansview(Integer.parseInt(qna_no));
		System.out.println("> ans_view : " + ans_view);
		request.setAttribute("ans_view", ans_view);
		System.out.println(">>>");
		//2. 응답페이지(list.jsp)에 전달(request 객체에 속성값으로 전달)
		request.setAttribute("qna_vo", qna_vo);
		//3. 페이지 전환 - 응답할 페이지(list.jsp)로 포워딩(전환)
		request.getRequestDispatcher("qnaview.jsp").forward(request, response);
		
		
		System.out.println(">>> process() 종료");
	}
}
