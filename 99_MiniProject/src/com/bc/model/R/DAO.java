package com.bc.model.R;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.Rvo.CustomerVO;
import com.bc.model.Rvo.QnaVO;
import com.bc.model.Rvo.ReserveVO;
import com.bc.model.Rvo.QnaAnsVO;
import com.bc.mybatis.DBService;

public class DAO {
	
	// 아이디로 회원번호 받아오는 메소드
	public static String getIdToNo(String cust_id) {
		SqlSession ss = DBService.getFactory().openSession();
		String idtono = ss.selectOne("hotel.idtono", cust_id);
		ss.close();
		return idtono;
	}
	
	// 내 정보 조회하는 메소드
	public static CustomerVO getMyInfo(String cust_no) {
		SqlSession ss = DBService.getFactory().openSession();
		CustomerVO cvo = ss.selectOne("hotel.myInfo", cust_no);
		ss.close();
		return cvo;
	}
	
	// 내 정보 수정하는 메소드
	public static int updateMe(CustomerVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("hotel.updateMyInfo", vo);
		ss.close();
		return result;
	}
	
	// 회원탈퇴하는 메소드
	public static int deleteMe(String cust_no) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("hotel.deleteMe", cust_no);
		ss.close();
		return result;
	}
	
	// 내 예약내역의 전체 건수 조회
	public static int getTotalCount(String cust_no) {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("hotel.totalCount", cust_no);
		ss.close();
		return totalCount;
	}
	


	// 내 예약내역 상세보기
	public static ReserveVO getBookingOne(Map<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession();
		ReserveVO rvo = ss.selectOne("hotel.bookingone", map);
		ss.close();
		return rvo;
	}
	
	
	
	// 내 예약내역 리스트 가져오기  (예약한 사람의 이름, 전화번호, 이메일)
	public static List<ReserveVO> getList (Map<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<ReserveVO> rlist = ss.selectList("hotel.bookinglist", map);
		ss.close();
		return rlist;
	}
	
	
	// 예약자 정보 변경 (예약한 사람의 이름, 전화번호, 이메일)
	public static int updateRevInfo(ReserveVO newrvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("hotel.updatebooking", newrvo);
		ss.close();		
		return result;
	}
	
	// 예약취소하는 메소드
	public static int cancelBooking(String rev_no) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("hotel.cancelbooking", rev_no);
		ss.close();
		return result;
	}
	
	
	// 내 문의글 전체 건수 조회
	public static int getQnaCount(String cust_no) {
		SqlSession ss = DBService.getFactory().openSession();
		int qnaCount = ss.selectOne("hotel.qnacount", cust_no);
		ss.close();
		return qnaCount;
	}
	
	
	// 내 문의내역 리스트 가져오기
	public static List<QnaVO> getQnaList (Map<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<QnaVO> qlist = ss.selectList("hotel.qnalist", map);
		ss.close();
		return qlist;
	}
	
	
	
	// 내 문의글 상세보기
	public static QnaVO getQnaOne(Map<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession();
		QnaVO qvo = ss.selectOne("hotel.qnadetail", map);
		ss.close();
		return qvo;
	} 
	

	// 내 문의글에 달린 댓글보기
	public static List<QnaAnsVO> getCommList(String qna_no) {
		SqlSession ss = DBService.getFactory().openSession();
		List<QnaAnsVO> qalist = ss.selectList("hotel.commlist", qna_no);
		ss.close();
		return qalist;
	}
	
	
	// 내 문의글 수정하기
	public static int modifyqna(QnaVO qvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("hotel.qnamodify", qvo);
		ss.close();
		return result;
	}
	
	
	// 내 문의글 삭제하기
	public static int deleteqna (String qna_no) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("hotel.qnadelete", qna_no);
		ss.close();
		return result;
	}
	

	// 문의글 쓰기
	public static int writeqna (QnaVO Qvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("qna.insert", Qvo);
		ss.close();
		return result;
	}
	
	
	
	
			
		
		
		
		
		
}
