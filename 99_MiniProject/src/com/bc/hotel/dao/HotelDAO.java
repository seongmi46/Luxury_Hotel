package com.bc.hotel.dao;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.hotel.vo.HotelVO;
import com.bc.hotel.vo.ReserveVO;
import com.bc.mybatis.DBService;

public class HotelDAO {
	/******* 룸(ROOM)의 전체 건수 조회 *******/
	public static int getTotalCount(String hotel_no) {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("hotels.totalCount", hotel_no);
		ss.close();
		return totalCount;
	}
	
	/******* 페이지에 해당하는 룸목록 가져오기 *******/
	public static List<HotelVO> getList(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<HotelVO> list = ss.selectList("hotels.list", map);
		ss.close();
		return list;
	}
	
	
	/******* 모든 방 조회 *******/
	public static List<HotelVO> getRoomList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<HotelVO> list = ss.selectList("hotels.allRoom");
		ss.close();
		return list;
	}
	
	/******* 모든 호텔 조회 *******/
	public static List<HotelVO> getHotelList(){
		SqlSession ss = DBService.getFactory().openSession();
		List<HotelVO> list = ss.selectList("hotels.allHotel");
		ss.close();
		return list;
	}
	
	/******* 모든 호텔&방 조회 *******/
	public static List<HotelVO> getAllList(){
		SqlSession ss = DBService.getFactory().openSession();
		List<HotelVO> list = ss.selectList("hotels.allHotelRoom");
		ss.close();
		return list;
	}
	
	/******* 호텔 이름으로 호텔조회 *******/
	public static HotelVO hotelInfoName(String hotel_name){
		SqlSession ss = DBService.getFactory().openSession();
		HotelVO list = ss.selectOne("hotels.hotelInfoName", hotel_name);
		ss.close();
		return list;
	}
	
	/******* 호텔 룸 갯수 조회 *******/
	public static int hotelRoomCount(String hotel_no) {
		SqlSession ss = DBService.getFactory().openSession();
		int roomCount = ss.selectOne("hotels.hotelRoomCount", hotel_no);
		ss.close();
		return roomCount;
	}
	
	/******* 해당 날짜에 예약된 객실 수 구하기 *******/
	public static int reserveRoomCount(String hotel_no, int room_no, String inDate) {
		SqlSession ss = DBService.getFactory().openSession();
		//System.out.println(hotel_no + "   " + room_no + "   " + inDate);
		Map<String, String> map = new HashMap<>();
		map.put("hotel_no", hotel_no);
		map.put("room_no", Integer.toString(room_no));
		map.put("inDate", inDate);
		
		int reserveCount = ss.selectOne("hotels.reserveRoomCount", map);
		ss.close();
		return reserveCount;
		
	}
	
	/******* 예약가능한 방 조회 *******/
	public static List<HotelVO> reservePossibleRoom(String hotel_no, int room_no, int reserveRoom, String people, String spa, String cooking, String smoking){
		SqlSession ss = DBService.getFactory().openSession();
		Map<String, String> map = new HashMap<>();
		map.put("hotel_no", hotel_no);
		map.put("room_no", Integer.toString(room_no));
		map.put("reserveRoom", Integer.toString(reserveRoom));
		map.put("people", people);
		map.put("spa", spa);
		map.put("cooking", cooking);
		map.put("smoking", smoking);
		List<HotelVO> list = ss.selectList("hotels.reservePossibleRoom", map);
		ss.close();
		return list;
	}
	
	/******* 룸 가격 조회 *******/
	public static int getRoomPrice(String hotel_no, String room_no) {
		SqlSession ss = DBService.getFactory().openSession();
		Map<String, String> map = new HashMap<>();
		map.put("hotel_no", hotel_no);
		map.put("room_no", room_no);
		int roomPrice = ss.selectOne("hotels.getRoomPrice", map);
		ss.close();
		return roomPrice;
	}

	/******* 회원 넘버 가져오기 *******/
	public static int getNo(String cust_id){
		SqlSession ss = DBService.getFactory().openSession();
		int cust_no = ss.selectOne("hotels.getNo", cust_id);
		ss.close();
		return cust_no;
	}
	
	/******* 룸 정보 가져오기 *******/
	public static HotelVO roomInfo(String hotel_no, String room_no) {
		SqlSession ss = DBService.getFactory().openSession();
		Map<String, String> map = new HashMap<>();
		map.put("hotel_no", hotel_no);
		map.put("room_no", room_no);
		HotelVO list = ss.selectOne("hotels.roomInfo", map);
		ss.close();
		return list;
	}

	/******* 호텔 정보 가져오기 *******/
	public static HotelVO hotelInfoNo(String hotel_no) {
		SqlSession ss = DBService.getFactory().openSession();
		HotelVO list = ss.selectOne("hotels.roomInfo", hotel_no);
		ss.close();
		return list;
	}
	
	/******* 예약 정보 인서트 *******/
	public static int reserveInsert(ReserveVO rvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("hotels.revInsert", rvo);
		ss.close();
		return result;
		
	}
	
	
	/******* 맥스 rev_no 가져오기 *******/
	public static int getMaxRevNo() {
		SqlSession ss = DBService.getFactory().openSession();
		int maxRevNo = ss.selectOne("hotels.getMaxRevNo");
		ss.close();
		return maxRevNo;
	}
	
	
}
