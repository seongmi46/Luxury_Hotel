package com.bc.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.RoomVO;
import com.bc.model.vo.CustomerVO;
import com.bc.model.vo.HotelVO;
import com.bc.model.vo.QnA_AnsVO;
import com.bc.model.vo.QnA_VO;
import com.bc.model.vo.ReserveVO;
import com.bc.mybatis.DBService;

public class DAO {

	// 회원조회 페이징
	// list의 전체 건수 조회
	public static int getTotalCount1() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("MINI_PROJECT.list1");
		ss.close();
		return totalCount;
	}
	public static List<CustomerVO> getList1(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<CustomerVO> list = ss.selectList("MINI_PROJECT.list2", map);
		ss.close();
		return list;
	}
	//이름으로 회원 조회
	public static List<CustomerVO> getSearch(String idx, String keyword) {
		SqlSession ss = DBService.getFactory().openSession();
		Map<String, String> map = new HashMap<>();
		map.put("idx", idx);
		map.put("keyword", keyword);
		List<CustomerVO> list = ss.selectList("MINI_PROJECT.search", map);
		ss.close();
		return list;
	}
	
	public static List<CustomerVO> getSearchTest(String idx, String keyword) {
		SqlSession ss = DBService.getFactory().openSession();
		String mapperId = "";
		if ("0".equals(idx)) {
			mapperId = "MINI_PROJECT.search0";
		} else if ("1".equals(idx)) {
			mapperId = "MINI_PROJECT.search1";
		} 
		List<CustomerVO> list = ss.selectList(mapperId, keyword);
		ss.close();
		return list;
	}
	//수정/탈퇴 전 정보조회
	public static CustomerVO modify(String cust_no) {
		SqlSession ss = DBService.getFactory().openSession(true);
		CustomerVO cust = ss.selectOne("MINI_PROJECT.modify", cust_no);
		ss.close();
		return cust;
	}
	//회원 정보 수정/탈퇴
	public static void listupdate(CustomerVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("MINI_PROJECT.listupdate", vo);
		ss.close();
	}
	public static void listdelete(int cust_no) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("MINI_PROJECT.listdelete", cust_no);
		ss.close();
	}
	
	//----------------------------------------------------------------
	
	// 예약내역 페이징
	// RESERVE의 전체 건수 조회
	public static int getTotalCount2() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("MINI_PROJECT.list3");
		ss.close();
		return totalCount;
	}
	public static List<ReserveVO> getList2(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<ReserveVO> list = ss.selectList("MINI_PROJECT.list4", map);
		ss.close();
		return list;
	}
	
	//예약/회원 번호로 조회
	public static List<ReserveVO> getSearch1(String idx, String keyword) {
		SqlSession ss = DBService.getFactory().openSession();
		Map<String, String> map = new HashMap<>();
		map.put("idx", idx);
		map.put("keyword", keyword);
		List<ReserveVO> list = ss.selectList("MINI_PROJECT.searchRS", map);
		ss.close();
		return list;
	}
	
	public static List<ReserveVO> getSearchTest1(String idx, String keyword) {
		SqlSession ss = DBService.getFactory().openSession();
		String mapperId = "";
		if ("2".equals(idx)) {
			mapperId = "MINI_PROJECT.search2";
		} else if ("3".equals(idx)) {
			mapperId = "MINI_PROJECT.search3";
		} 
		List<ReserveVO> list = ss.selectList(mapperId, keyword);
		ss.close();
		return list;
	}
	//수정/취소 전 정보조회
	public static ReserveVO modify1(String rev_no) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ReserveVO reserve = ss.selectOne("MINI_PROJECT.modify1", rev_no);
		ss.close();
		return reserve;
	}
	//예약내역 수정/취소
	public static void reserveupdate(ReserveVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		System.out.println(vo);
		ss.update("MINI_PROJECT.reserveupdate", vo);
		ss.close();
	}
	public static void reservedelete(int rev_no) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("MINI_PROJECT.reservedelete", rev_no);
		ss.close();
	}
	//------------------------------------------------------------
	
	// HOTEL의 전체 건수 조회
	public static int getTotalCount3() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("MINI_PROJECT.list5");
		ss.close();
		return totalCount;
	}
	public static List<HotelVO> getList3(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<HotelVO> list = ss.selectList("MINI_PROJECT.list6", map);
		ss.close();
		return list;
	}
	//호텔추가
	public static void hotelinsert(HotelVO hotelinsert) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.insert("MINI_PROJECT.hotelinsert", hotelinsert);
		ss.close();
	}
	
	//-----------------------------------------------------------
	// HOTEL ROOM의 전체 건수 조회
	public static int getTotalCount4() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("MINI_PROJECT.list7");
		ss.close();
		return totalCount;
	}
	public static List<RoomVO> getList4(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<RoomVO> list = ss.selectList("MINI_PROJECT.list8", map);
		ss.close();
		return list;
	}
	// 방/호텔 번호로 룸 조회
	public static List<RoomVO> getSearch2(String hotel_no) {
		SqlSession ss = DBService.getFactory().openSession();
		List<RoomVO> list = ss.selectList("MINI_PROJECT.hmsearch", hotel_no);
		ss.close();
		return list;
	}
	
	//--------------------------------------------------------------------------
	//qna 조회
	public static List<QnA_VO> getQnalist(){
		System.out.println("1111111111111111111");
		SqlSession ss = DBService.getFactory().openSession(true);
		List<QnA_VO> qnasearch = ss.selectList("MINI_PROJECT.qnalist");
		System.out.println("22222222222222222222222222");
		ss.close();
		return qnasearch;
	}
	   //qna 조회 페이징
	   public static int getTotalCount5() {
	      SqlSession ss = DBService.getFactory().openSession();
	      int totalCount = ss.selectOne("MINI_PROJECT.list9");
	      ss.close();
	      return totalCount;
	   }
	   
	   public static List<QnA_VO> getList5(Map<String, Integer> map) {
	      SqlSession ss = DBService.getFactory().openSession();
	      List<QnA_VO> list = ss.selectList("MINI_PROJECT.list10", map);
	      ss.close();
	      return list;
	   }

	
	//qna 예약/회원 번호로 조회
	public static List<QnA_VO> getQnasearch(String idx, String keyword) {
		SqlSession ss = DBService.getFactory().openSession();
		Map<String, String> map = new HashMap<>();
		map.put("idx", idx);
		map.put("keyword", keyword);
		List<QnA_VO> qnalist = ss.selectList("MINI_PROJECT.qnasearch", map);
		ss.close();
		return qnalist;
	}
	
	public static List<QnA_VO> getQnasearchtest(String idx, String keyword) {
		SqlSession ss = DBService.getFactory().openSession();
		String mapperId = "";
		if ("4".equals(idx)) {
			mapperId = "MINI_PROJECT.search4";
		} else if ("5".equals(idx)) {
			mapperId = "MINI_PROJECT.search5";
		} 
		List<QnA_VO> qnalist = ss.selectList(mapperId, keyword);
		ss.close();
		return qnalist;
	}
	
	//qna 상세 조회
	public static QnA_VO Selectone(int qna_no) {
		SqlSession ss = DBService.getFactory().openSession();
		QnA_VO qvo = ss.selectOne("MINI_PROJECT.selectone",qna_no);
		ss.close();
		return qvo;
	}
	//qna 답변 추가
	public static void qna_ans_write(QnA_AnsVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.insert("MINI_PROJECT.qna_ans_write", vo);
		ss.close();
	}
	//qna 답변가져오기
	public static List<QnA_AnsVO> ansview(int qna_no) {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<QnA_AnsVO> ansview = ss.selectList("MINI_PROJECT.ansview", qna_no);
		ss.close();
		return ansview;
	}
	//qna 답변 삭체하기
	public static void qna_ans_delete(int qna_vo){
		SqlSession ss= DBService.getFactory().openSession(true);
		ss.delete("MINI_PROJECT.qna_ans_delete", qna_vo);
		ss.close();
	}
	
	
	
	
	
	
	
}









