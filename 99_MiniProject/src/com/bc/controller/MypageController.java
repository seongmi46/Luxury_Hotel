package com.bc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.model.R.DAO;
import com.bc.model.Rvo.CustomerVO;
import com.bc.model.Rvo.Paging;
import com.bc.model.Rvo.QnaAnsVO;
import com.bc.model.Rvo.QnaVO;
import com.bc.model.Rvo.ReserveVO;




@WebServlet("/R/MyPage")
public class MypageController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		String type = request.getParameter("type");
		String cust_id = (String)session.getAttribute("cust_id");  // 로그인 시 세션에 저장된 아이디값 가져와서
		String cust_no = DAO.getIdToNo(cust_id);  // 아이디값으로 회원번호 조회할 수 있게
		
		PrintWriter out = response.getWriter();
		
		if ("select".equals(type)) {
			String opt = request.getParameter("opt");
			
			if (opt == null || opt.equals("")) {
				request.getRequestDispatcher("MyPage.jsp").forward(request, response);
				
			} else {
				
				CustomerVO cvo = DAO.getMyInfo(cust_no);
				request.getSession().setAttribute("cvo", cvo);  // 세션에 저장하려면 이렇게 쓰면 됨
				// request.setAttribute("cvo", cvo);  // 속성에 저장
				
				
				String title = "";
				switch (opt) {
				case "0": 
					title = "개인정보조회";
					request.setAttribute("title", title);
					request.getRequestDispatcher("MyInfoList.jsp").forward(request, response);
					break;
				case "1":
					title = "예약내역";
					request.setAttribute("title", title);
					
					// ==== 페이징 처리
					Paging p = new Paging();
					
					// 전체 게시글 개수 구하기
					p.setTotalRecord(DAO.getTotalCount(cust_no));
					p.setTotalPage();
					System.out.println(p.getTotalPage());
					
					// 현제 페이지 구하기
					String cPage = request.getParameter("cPage");
					if (cPage != null) {
						p.setNowPage(Integer.parseInt(cPage));
					}
					
					// 현재 페이지에 표시할 시작번호(begin), 끝번호(end) 구하기
					p.setEnd(p.getNowPage() * p.getNumPerPage());
					p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
					
					// 끝 글번호가 데이터 건수보다 많아지면 데이터 건수와 동일한 번호로 설정
					if (p.getEnd() > p.getTotalRecord()) {
						p.setEnd(p.getTotalRecord());
					}
					
					// 블록 계산하기
					// 블록의 시작페이지 구하기
					int nowPage = p.getNowPage();
					int beginPage = (nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
					p.setBeginPage(beginPage);
					p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
					
					// 끝페이지가 전체 페이지수보다 크면 끝페이지를 전체 페이지수로 변경
					if (p.getEndPage() > p.getTotalPage()) {
						p.setEndPage(p.getTotalPage());
					}
					System.out.println("> 예약 전체 게시글 수: " + p.getTotalRecord());
					System.out.println("> 예약 전체 페이지 수: " + p.getTotalPage());
					
					
					System.out.println("-------------");
					System.out.println(">> 예약 현재페이지: " + p.getNowPage());
					System.out.println(">> 예약 시작번호(begin): " + p.getBegin());
					System.out.println(">> 예약 끝번호(end): " + p.getEnd());
					
					System.out.println(">> 예약 시작페이지(beginPage): " + p.getBeginPage());
					System.out.println(">> 예약 끝페이지(endPage): " + p.getEndPage());

					request.getSession().setAttribute("pvo", p);
					// request.setAttribute("pvo", p);
					
					
					
					Map<String, String> map = new HashMap<String, String>();
					map.put("cust_no", cust_no);
					map.put("begin", Integer.toString(p.getBegin()));
					map.put("end", Integer.toString(p.getEnd()));
					List<ReserveVO> rlist = DAO.getList(map);
					
					request.getSession().setAttribute("rlist", rlist);
					// request.setAttribute("rlist", rlist);
					
					System.out.println("예약  rlist: " + rlist);
					
					request.getRequestDispatcher("MyBookingList.jsp").forward(request, response);
					break;
					

					
				case "2":
					title = "문의내역";
					request.setAttribute("title", title);
					
					// 예약내역 보는거랑 똑같이 만들기
					// ==== 페이징 처리
					Paging p2 = new Paging();
					
					// 전체 게시글 개수 구하기
					p2.setTotalRecord(DAO.getQnaCount(cust_no));
					p2.setTotalPage();
					System.out.println(p2.getTotalPage());
					
					// 현재 페이지 구하기
					String cPage2 = request.getParameter("cPage2");
					if (cPage2 != null) {
						p2.setNowPage(Integer.parseInt(cPage2));
					}
					
					// 현재 페이지에 표시할 시작번호(begin), 끝번호(end) 구하기
					p2.setEnd(p2.getNowPage() * p2.getNumPerPage());
					p2.setBegin(p2.getEnd() - p2.getNumPerPage() + 1);
					
					// 끝 글번호가 데이터 건수보다 많아지면 데이터 건수와 동일한 번호로 설정
					if (p2.getEnd() > p2.getTotalRecord()) {
						p2.setEnd(p2.getTotalRecord());
					}
					
					// 블록 계산하기
					// 블록의 시작페이지 구하기
					nowPage = p2.getNowPage();
					beginPage = (nowPage - 1) / p2.getPagePerBlock() * p2.getPagePerBlock() + 1;
					p2.setBeginPage(beginPage);
					p2.setEndPage(p2.getBeginPage() + p2.getPagePerBlock() - 1);
					
					// 끝페이지가 전체 페이지수보다 크면 끝페이지를 전체 페이지수로 변경
					if (p2.getEndPage() > p2.getTotalPage()) {
						p2.setEndPage(p2.getTotalPage());
					}
					System.out.println("> 문의 전체 게시글 수: " + p2.getTotalRecord());
					System.out.println("> 문의 전체 페이지 수: " + p2.getTotalPage());
					
					
					System.out.println("-------------");
					System.out.println(">> 문의 현재페이지: " + p2.getNowPage());
					System.out.println(">> 문의 시작번호(begin): " + p2.getBegin());
					System.out.println(">> 문의 끝번호(end): " + p2.getEnd());
					
					System.out.println(">> 문의 시작페이지(beginPage): " + p2.getBeginPage());
					System.out.println(">> 문의 끝페이지(endPage): " + p2.getEndPage());

					request.getSession().setAttribute("pvo2", p2);
					// request.setAttribute("pvo2", p2);
					
					
					
					Map<String, String> map2 = new HashMap<String, String>();
					map2.put("cust_no", cust_no); 
					map2.put("begin", Integer.toString(p2.getBegin()));
					map2.put("end", Integer.toString(p2.getEnd()));
					List<QnaVO> qlist2 = DAO.getQnaList(map2);
					
					request.getSession().setAttribute("qlist2", qlist2);
					// request.setAttribute("qlist2", qlist2);
					
					System.out.println("문의  qlist2: " + qlist2);
					
					
					
					request.getRequestDispatcher("MyQnaList.jsp").forward(request, response);
					break;
				}
		
			} 
			
		} else if ("qnadetail".equals(type)) {
		
			// 문의글 상세보기
			String qna_no = request.getParameter("qna_no");
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("cust_no",cust_no);
			map.put("qna_no",qna_no);
			
			QnaVO qvo = DAO.getQnaOne(map);
			System.out.println(">> qvo: " + qvo);
			
			request.getSession().setAttribute("qvo", qvo);
			// request.setAttribute("qvo", qvo);
			// 문의글에 달린 댓글 표시
			
			System.out.println("댓글 qna_no: " + qna_no);
			
			List<QnaAnsVO> qalist = DAO.getCommList(qna_no);
			
			request.getSession().setAttribute("qalist", qalist);
			// request.setAttribute("qalist", qalist);
			
			System.out.println("댓글 qalist: " + qalist);
			
			request.getRequestDispatcher("MyQnaView.jsp").forward(request, response);
						
		} else if ("deleteqna".equals(type)) {	
			
			String qna_no = request.getParameter("qna_no");
			
			int result = DAO.deleteqna(qna_no);
			
			System.out.println("문의글 삭제 result: " + result);
			
			
			
			request.getRequestDispatcher("MyPage?type=select&opt=2").forward(request, response);
			
		} else if ("modifyqna".equals(type)) {
			
			request.getRequestDispatcher("MyQnaUpdate.jsp").forward(request, response);
			
			
		
		} else if ("qnaupdate".equals(type)) {
			// 문의글 수정
			
			String qna_no = request.getParameter("qna_no");
			String cust_name = request.getParameter("name");
			String newtitle = request.getParameter("title");
			String newcontent = request.getParameter("content");
			String qnaopt = request.getParameter("qnaopt");
			System.out.println(">>>>>>>> " + cust_name);
			switch (qnaopt) {
			case "0" : 
				qnaopt = "호텔가입";
				break;
			case "1" : 
				qnaopt = "호텔이용";
				break;
			case "2" : 
				qnaopt = "호텔객실";
				break;
			case "3" : 
				qnaopt = "칭찬해요";
				break;
			case "4" : 
				qnaopt = "건의사항";
				break;
			}
			
			System.out.println("qnaopt: " + qnaopt);
			
			String newphone = request.getParameter("phone");
			
			QnaVO qvo = new QnaVO();
			qvo.setQna_title(newtitle);
			qvo.setQna_content(newcontent);
			qvo.setQna_type(qnaopt);
			qvo.setCust_phone(newphone);
			qvo.setQna_no(qna_no);
			int result = DAO.modifyqna(qvo);
			
			qvo.setCust_name(cust_name);
			request.getSession().setAttribute("qvo", qvo);
			// request.setAttribute("qvo", qvo);
			
			
			
			System.out.println("문의글 수정 result: " + result);
			
			request.getRequestDispatcher("MyQnaView.jsp").forward(request, response);
			
		
		} else if ("updatepwd".equals(type)) {
			// 이거 말고 팝업창으로 띄우기
			request.getRequestDispatcher("UpdatePwd.jsp").forward(request, response);	
			
		} else if ("updateform".equals(type)) {
			System.out.println("#######");
			request.getRequestDispatcher("UpdateForm.jsp").forward(request, response);
			
			
		} else if ("updateok".equals(type)) {
			System.out.println("2#######");
			
			String pwd = request.getParameter("pwd");  // 새로 입력한 정보 가져오기
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			System.out.println("new phone: " + phone);
			
			CustomerVO updatecvo = new CustomerVO();
			updatecvo.setCust_pwd(pwd);
			updatecvo.setCust_phone(phone);
			updatecvo.setCust_email(email);
			updatecvo.setCust_no(cust_no);
			
			System.out.println("new pwd: " + pwd);
			System.out.println("new phone: " + phone);
			System.out.println("new email: " + email);
			
			request.setAttribute("updatecvo", updatecvo);
			int result = DAO.updateMe(updatecvo);
			
			System.out.println("result: " + result);
			
			
			
			request.getRequestDispatcher("UpdateOk.jsp").forward(request, response);
			
		} else if ("bookingdetail".equals(type)) {
			
			// 예약내역 상세보기
			String rev_no = request.getParameter("rev_no");
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("cust_no",cust_no);
			map.put("rev_no",rev_no);
			
			ReserveVO rvo = DAO.getBookingOne(map);
			System.out.println(">> rvo: " + rvo);
			
			request.getSession().setAttribute("rvo", rvo);
			// request.setAttribute("rvo", rvo);
			
			request.getRequestDispatcher("MyBookingView.jsp").forward(request, response);
			
		} else if ("modifybooking".equals(type)) {
			// 예약정보변경 (예약자명, 전화번호, 이름만 변경) > 여기서는 굳이 비밀번호 확인 안해줘도 되지 않을까
			// > 변경할 정보 입력받는 페이지로 이동
			
			request.getRequestDispatcher("MyBookingUpdate.jsp").forward(request, response);
		
		} else if ("modifybookingok".equals(type)) {
			// 입력한 정보 받아와서 입력 완료 (수정된 정보 보여주는 페이지로 이동)
			
			String rev_no = request.getParameter("rev_no");
			
			String newname = request.getParameter("newname");
			String newphone = request.getParameter("newphone");
			String newemail = request.getParameter("newemail");
			
			ReserveVO rvo = new ReserveVO();
			
			rvo.setRev_name(newname); 
			rvo.setRev_phone(newphone);
			rvo.setRev_email(newemail);
		  
			rvo.setRev_no(rev_no);
			 
			System.out.println(">> " + rvo);
			int result = DAO.updateRevInfo(rvo);
			request.setAttribute("newrvo", rvo);
			
			
			
			System.out.println("예약정보변경 newrvo result: " + result);
			
			// 페이지 이동
			request.getRequestDispatcher("MyBookingUpdateOk.jsp").forward(request, response);
			
			
		} else if ("cancelbooking".equals(type)) {
		
			// 이 페이지에서 비밀번호 확인받기
			request.getRequestDispatcher("MyBookingCancel.jsp").forward(request, response);
			
			
		} else if ("cancelbookingok".equals(type)) {
			// 예약취소
			
			String rev_no = request.getParameter("rev_no");
			int result = DAO.cancelBooking(rev_no);
			System.out.println("예약번호 - 취소용: " + rev_no);
			
			System.out.println("예약취소 result: " + result);
			
			// 예약 취소 되었다는 메세지 표시하고 예약목록 보여주기 (변경된 후)
			request.getRequestDispatcher("MyBookingCancelOk.jsp").forward(request, response);
			
			
			
		} else if ("deleteme".equals(type)) {
			// 회원탈퇴 비밀번호 확인
			request.getRequestDispatcher("CustDelete.jsp").forward(request, response);
			
		} else if ("deletenow".equals(type)) {
	
			request.getRequestDispatcher("CustDeletePlease.jsp").forward(request, response);
			
			
		} else if("deleteok".equals(type)) {
			
			int result = DAO.deleteMe(cust_no);
			
			System.out.println("탈퇴result: " + result);
			
			session.invalidate();
			
			
			request.getRequestDispatcher("../S/reserveMain.jsp").forward(request, response);
			
			
		} else if ("qnawrite".equals(type)) {
			
			// 문의글 쓰는 페이지로 이동
			
			request.getRequestDispatcher("write.jsp").forward(request, response);
			
		} else if ("qnawriteok".equals(type)) {
			
			// 입력받은 값 가져오기
			
			// String cust_name = request.getParameter("name");
			String c_no = request.getParameter("cust_no");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String qnaopt = request.getParameter("qnaopt");
			String pwd = request.getParameter("pwd");
			// System.out.println(">>>>>>>> " + cust_name);
			switch (qnaopt) {
			case "0" : 
				qnaopt = "호텔가입";
				break;
			case "1" : 
				qnaopt = "호텔이용";
				break;
			case "2" : 
				qnaopt = "호텔객실";
				break;
			case "3" : 
				qnaopt = "칭찬해요";
				break;
			case "4" : 
				qnaopt = "건의사항";
				break;
			}
			
			System.out.println("qnaopt: " + qnaopt);
			
			String phone = request.getParameter("phone");
			
			QnaVO qna = new QnaVO();
			qna.setCust_no(c_no);
			qna.setQna_title(title);
			qna.setQna_content(content);
			qna.setQna_type(qnaopt);
			qna.setCust_phone(phone);
			qna.setQna_pwd(pwd);
			// qvo.setQna_no(qna_no);
			int result = DAO.writeqna(qna);
			
			// qvo.setCust_name(cust_name);
			request.getSession().setAttribute("qna", qna);
			// request.setAttribute("qvo", qvo);
			
			
			
			System.out.println("문의글쓰기 result: " + result);
			
			request.getRequestDispatcher("MyPage?type=select&opt=2").forward(request, response);
			
			
			
			
			
		}
		
		
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
