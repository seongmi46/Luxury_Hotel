package com.bc.hotelcontroller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.vo.HotelVO;
import com.bc.model.vo.Paging;

@WebServlet("/J/hotellist")
public class HotelListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> doGet() 시작");
		
		System.out.println(">>> doGet 업무처리 process ~~~~");
		process(request, response);
		
		System.out.println("> doGet() 종료");
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> doPost() 시작");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
		System.out.println("> doPost() 종료");
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		System.out.println(">>> process() 시작");
		System.out.println(">>> DB에서 데이터 가져와서 list.jsp로 전달");
		/*현재 페이지에 표시할 데이터를 화면에 표시 
		1. 페이징 처리를 위한 객체(Paging) 생성해서 필요한 데이터 참조
		2. 페이징 객체에 설정할 데이터 저장 
		3. (DB) 전체데이터 조회
		4. (DB) 현재페이지에 표시할 데이터 조회
		5. 데이터 화면에 표시(화면컨트롤-스타일 설정)
		*/

		// 페이징 처리를 위한 Paging 객체 생성해서 값 읽고 설정
		Paging p = new Paging();

		//1. 전체 게시물의 수를 구하기
		System.out.println("DAO.getTotalCount3(): " + DAO.getTotalCount3());
		p.setTotalRecord(DAO.getTotalCount3());
		p.setTotalPage();
		System.out.println("> 전체 게시글 수 : " + p.getTotalRecord());
		System.out.println("> 전체 페이지 수 : " + p.getTotalPage());
		
		//2. 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage()); //현재페이지번호 * 페이지당글수
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
		
		//(선택적) 3-1 끝 글번호가 데이터건수보다 많아지면 데이터 건수와 동일한 번호로 설정
		if (p.getEnd() > p.getTotalRecord()) {
			p.setEnd(p.getTotalRecord());
		}
		System.out.println("-----------");
		System.out.println(">>현재페이지 : " + p.getNowPage());
		System.out.println(">>시작번호(begin) : " + p.getBegin());
		System.out.println(">>끝번호(end) : " + p.getEnd());
		
		//---- 블록(block) 계산하기 -----------
		//4. 블록의 시작페이지, 끝페이지 구하기(현재 페이지 번호 사용)
		//시작페이지 번호 구하기
		int nowPage = p.getNowPage();
		int beginPage = (nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
		/*
		(개인실습) 위의 시작페이지, 끝페이지 구하기 방식을
		현재페이지가 위치한 블록값을 구하고
		블록값을 기준으로 끝페이지 구한 후 시작페이지 구하기 
		*/
		//4-1 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
		// 끝페이지를 전체페이지수로 변경처리
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		System.out.println(">>시작페이지(beginPage) : " + p.getBeginPage());
		System.out.println(">>끝페이지(endPage) : " + p.getEndPage());

		//=============================================
		//현재 페이지 기준으로 DB데이터(게시글) 가져오기
		//시작글번호, 끝 글번호로 Map 데이터 만들기(전달할 파라미터 값)
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());
		
		List<HotelVO> list3 = DAO.getList3(map); 
		System.out.println("> 현재페이지 글목록(list2): " + list3);
 
		//================================
		// EL, JSTL 사용을 위해 scope에 데이터 등록(page 영역)
		request.setAttribute("list3", list3);
		request.setAttribute("pvo", p);
		
		//3. 페이지 전환 - 응답할 페이지(hotellist.jsp)로 포워딩(전환)
		request.getRequestDispatcher("hotellist.jsp").forward(request, response);
		
		System.out.println(">>> process() 종료");
	}
}







