package com.bc.hotel.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.hotel.dao.HotelDAO;
import com.bc.hotel.vo.HotelVO;
import com.bc.hotel.vo.ReserveVO;
import com.bc.mybatis.Paging;



@WebServlet("/S/controller")
public class FrontController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController.doGet() 실행~~ ");
		request.setCharacterEncoding("UTF-8");	
		//요청에 대한 처리
		String type = request.getParameter("type");
		System.out.println(type);
		HttpSession session = request.getSession();
		/********* main에서 조건 선택하고 방보러가는 메뉴 ********/
		if("main".equals(type)) {	
			String hotelName = null;
			String inDate = null;
			String outDate = null;
			String people = null;
			if(session.getAttribute("hotelName") == null) {
				hotelName = request.getParameter("hotelName");
				inDate = request.getParameter("inDate");
				outDate = request.getParameter("outDate");
				people = request.getParameter("people");
				//System.out.println(hotelName);
				request.setAttribute("hotelName", hotelName);
				request.setAttribute("inDate", inDate);
				request.setAttribute("outDate", outDate);
				request.setAttribute("people", people);
				session.setAttribute("hotelName", hotelName);
				session.setAttribute("inDate", inDate);
				session.setAttribute("outDate", outDate);
				session.setAttribute("people", people);
			} else {
				hotelName = (String)session.getAttribute("hotelName");
				inDate = (String)session.getAttribute("inDate");
				outDate = (String)session.getAttribute("outDate");
				people = (String)session.getAttribute("people");
			}
			
			String spa = "0";
			String cooking = "0";
			String smoking = "0";
			
			
			// 룸 옵션값 가져오기
			if(request.getParameter("spa") != null) {
				spa = request.getParameter("spa");
				if(spa == "") {
					spa = "0";
				}
				request.setAttribute("spa", spa);
			}
			if(request.getParameter("cooking") != null) {
				cooking = request.getParameter("cooking");
				if(cooking == "") {
					cooking = "0";
				}
				request.setAttribute("cooking", cooking);
			}
			if(request.getParameter("smoking") != null) {
				smoking = request.getParameter("smoking");
				if(smoking == "") {
					smoking = "0";
				}
				request.setAttribute("smoking", smoking);
			}

			
			
			/*if(request.getParameter("roomOption") != null) {
				String[] arr = request.getParameterValues("roomOption");
				System.out.println(arr.length);
				request.setAttribute("arr", arr);
				request.setAttribute("arrSize", arr.length);
			}*/
			
			
			//1. DB연결하고 데이터 가져오기
			HotelVO hotelInfo = HotelDAO.hotelInfoName(hotelName);
			String hotel_no = Integer.toString(hotelInfo.getHotel_no());
			
			List<HotelVO> list = new ArrayList<HotelVO>();
			List<HotelVO> list1 = null;

			int hotelRoomCount = HotelDAO.hotelRoomCount(hotel_no);
			int reserveRoom = -1;
			for(int room_no = 1; room_no <= hotelRoomCount; room_no++) {
				list1 = null;
				reserveRoom = HotelDAO.reserveRoomCount(hotel_no, room_no, inDate);
				list1 = HotelDAO.reservePossibleRoom(hotel_no, room_no, reserveRoom, people, spa, cooking, smoking);
				//System.out.println(room_no + "   " + list1);
				if(!list1.isEmpty()) {
						//System.out.println("몇번룸? " + room_no);
						list.addAll(list1);
				}
			}
			//2. 응답페이지(list.jsp)에 전달(request 객체에 속성값으로 전달)
			request.setAttribute("list", list);
			request.setAttribute("hotelInfo", hotelInfo);
			request.setAttribute("hotel_no", hotel_no);
			
			
			//페이징 처리를 위한 Paging 객체 생성해서 값 읽고 설정
			Paging p = new Paging();
			//System.out.println(">>>>>>>>>>>>> hotel_no : " + hotel_no);
			//1. 호텔별 룸 수를 구하기
			//p.setTotalRecord(HotelDAO.getTotalCount(hotel_no));
			p.setTotalRecord(list.size());
			System.out.println(">>> " + list.size());
			p.setTotalPage();
			System.out.println("> 전체 룸 수 : " + p.getTotalRecord());
			System.out.println("> 전체 룸 페이지 수 : " + p.getTotalPage());
			
			//2. 현재 페이지 구하기
			String cPage = request.getParameter("cPage");
			System.out.println("cPage : " + cPage);
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
			map.put("hotel_no", Integer.parseInt(hotel_no));
			map.put("reserveRoom" , reserveRoom);
			map.put("people", Integer.parseInt(people));
			map.put("spa", Integer.parseInt(spa));
			map.put("cooking", Integer.parseInt(cooking));
			map.put("smoking", Integer.parseInt(smoking));
			
			List<HotelVO> roomList = HotelDAO.getList(map); 
			System.out.println("> 현재페이지 글목록(list): " + roomList);
			
			request.setAttribute("pvo", p);
			request.setAttribute("roomList", roomList);
			
			//session.setAttribute("loginID", "ONERYOUNG");
			
			
			
			
			//3. 페이지 전환 - 응답할 페이지(list.jsp)로 포워딩(전환)
			request.getRequestDispatcher("reserveRoom.jsp").forward(request, response);
		}
		
		
		// 메인에서 호텔 선택하러 가는 메뉴
/*		else if("select".equals(type)) {		
			//1. DB연결하고 데이터 가져오기
			List<HotelVO> list = HotelDAO.getHotelList();
			
			//2. 응답페이지(list.jsp)에 전달(request 객체에 속성값으로 전달)
			request.setAttribute("list", list);
			
			//3. 페이지 전환 - 응답할 페이지(list.jsp)로 포워딩(전환)
			request.getRequestDispatcher("hotelSelect.jsp").forward(request, response);
		}*/
		// 호텔 선택하고 메인으로 돌아가는 메뉴
		/*else if("hotelselect".equals(type)) {
			//System.out.println(">>>>");
			String hotel = request.getParameter("hotel");
			//System.out.println(hotel);
			request.setAttribute("hotel", hotel);
			request.getRequestDispatcher("reserveMain.jsp").forward(request, response);
		}*/
		/********* 방까지 선택하고 정보 입력하러 가는 메뉴 ********/
		else if("reservePage".equals(type)) {
			String hotel_no = request.getParameter("hotel_no");
			String room_no = request.getParameter("room_no");
			String inDate = request.getParameter("inDate");
			String outDate = request.getParameter("outDate");
			String people = request.getParameter("people");
			
			//System.out.println("hotel_no : " + hotel_no + "  , room_no : " + room_no + ", inDate : " + inDate
			//				+", outDate : " + outDate + ", people : " + people);
			HotelVO room = HotelDAO.roomInfo(hotel_no, room_no);
			//HotelVO hotel = HotelDAO.hotelInfoNo(hotel_no);
			//String cust_no = "3";      /******************  값 받아서 넣어줘야함  *******************/
			//String cust_id = HotelDAO.getId(cust_no);
			String cust_id = (String) session.getAttribute("cust_id");
			//int cust_no = HotelDAO.getNo(cust_id);

			
			
			request.setAttribute("hotel_no", hotel_no);
			request.setAttribute("room_no", room_no);
			request.setAttribute("inDate", inDate);
			request.setAttribute("outDate", outDate);
			request.setAttribute("people", people);
			request.setAttribute("room", room);
			//request.setAttribute("cust_no", cust_no);
			request.setAttribute("cust_id", cust_id);
			
			request.getRequestDispatcher("reservePage.jsp").forward(request, response);
		}
		/********* 예약정보 확인하기 ********/
		else if("reserveOk".equals(type)) {
			String hotel_no = request.getParameter("hotel_no");
			String room_no = request.getParameter("room_no");
			String rev_people = request.getParameter("people");
			String inDate = request.getParameter("inDate");
			String outDate = request.getParameter("outDate");
			String cust_id = (String) session.getAttribute("cust_id");
			String rev_name = request.getParameter("name");
			String rev_email = request.getParameter("email");
			String rev_phone = request.getParameter("phone");
		
			ReserveVO rvo = new ReserveVO();
			rvo.setHotel_no(Integer.parseInt(hotel_no));
			rvo.setRev_room_no(Integer.parseInt(room_no));
			rvo.setRev_people(Integer.parseInt(rev_people));
			rvo.setRev_in(inDate);
			rvo.setRev_out(outDate);
			rvo.setCust_id(cust_id);
			rvo.setRev_name(rev_name);
			rvo.setRev_email(rev_email);
			rvo.setRev_phone(rev_phone);
			System.out.println("   rvo: " + rvo);
			HotelVO roonInfo = HotelDAO.roomInfo(hotel_no, room_no);
			
			request.setAttribute("rvo", rvo);
			request.setAttribute("roonInfo", roonInfo);
			request.getRequestDispatcher("reserveEnd.jsp").forward(request, response);
		}
		/********* 예약내용 인서트 하기 ********/
		else if("reserveEnd".equals(type)) {
			String hotel_no = request.getParameter("hotel_no");
			String room_no = request.getParameter("room_no");
			String cust_id = (String) session.getAttribute("cust_id");
			System.out.println(cust_id);
			int cust_no = HotelDAO.getNo(cust_id);
			String rev_people = request.getParameter("people");
			String inDate = request.getParameter("inDate");
			String outDate = request.getParameter("outDate");
			
			String rev_name = request.getParameter("name");
			String rev_email = request.getParameter("email");
			String rev_phone = request.getParameter("phone");
			String rev_price = request.getParameter("price");
			ReserveVO rvo = null;
			int result = -1;
			System.out.println(">>며칠인지? " +(Integer.parseInt(outDate) - Integer.parseInt(inDate)));
			if((Integer.parseInt(outDate) - Integer.parseInt(inDate)) == 1) {
				rvo = new ReserveVO( Integer.parseInt(hotel_no), cust_no, Integer.parseInt(room_no),
						inDate, outDate, Integer.parseInt(rev_price), rev_name, Integer.parseInt(rev_people) , rev_email, rev_phone
						);
				result = HotelDAO.reserveInsert(rvo);
				System.out.println(rvo);
			} else if ((Integer.parseInt(outDate) - Integer.parseInt(inDate)) > 1) {
				for(int i = Integer.parseInt(inDate); i < Integer.parseInt(outDate); i++) {
					rvo = new ReserveVO( Integer.parseInt(hotel_no), cust_no, Integer.parseInt(room_no),
							Integer.toString(i), Integer.toString(i+1), Integer.parseInt(rev_price), rev_name, Integer.parseInt(rev_people) , rev_email, rev_phone
							);
					result = HotelDAO.reserveInsert(rvo);
					System.out.println(rvo);
				}
				
			}
			
			
			
			
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			//result = HotelDAO.reserveInsert(rvo);
			
			if(result > 0) {
				System.out.println(">>>>>>> 성공");
				out.println("<script>alert('예약이 완료되었습니다.'); location.href='reserveMain.jsp';</script>");
				out.flush();

			} else {
				System.out.println(">>>>>>> 실패");
				out.println("<script>alert('예약에 실패했습니다. 다시 시도해주세요.'); location.href='reserveMain.jsp';</script>");
				out.flush();
				
			}
			out.close();
			request.setAttribute("rvo", rvo);
			
		}
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
