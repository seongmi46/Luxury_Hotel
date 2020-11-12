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

@WebServlet("/J/qna_ans_write")
public class QnaAnsWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qna_no = Integer.parseInt(request.getParameter("qna_no"));
		int cust_no = Integer.parseInt(request.getParameter("cust_no"));
		String ans_content = request.getParameter("ans_content");
		
		QnA_AnsVO vo = new QnA_AnsVO(qna_no, cust_no, ans_content);
		DAO.qna_ans_write(vo);
		
		QnA_VO qna_vo = DAO.Selectone(qna_no);
		request.setAttribute("qna_vo", qna_vo);
		

		
		List<QnA_AnsVO> ans_view = DAO.ansview(qna_no);
		System.out.println("> ans_view : " + ans_view);
		request.setAttribute("ans_view", ans_view);
		
		request.getRequestDispatcher("qnaview.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}