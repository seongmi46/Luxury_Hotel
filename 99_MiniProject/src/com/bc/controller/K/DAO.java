package com.bc.controller.K;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.mybatis.DBService;


public class DAO {
	/*회원가입*/
	public static int joingo(CustomerVO vo) {
		System.out.println("aa");
		SqlSession ss = DBService.getFactory().openSession(true);
		System.out.println("bb");
		int result = ss.insert("mini_project.insert", vo);
		ss.close();
		return result;
	}
	/*중복확인*/
	public static int idCheck(String cust_id) {
	SqlSession ss = DBService.getFactory().openSession();

	int user = ss.selectOne("mini_project.idCheck", cust_id);
	ss.close();
	System.out.println("user " + user);
	return user;
	}
	/*로그인*/
	public static int loginUsers(String cust_id, String cust_pwd) {
		SqlSession ss = DBService.getFactory().openSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("cust_id", cust_id);
		map.put("cust_pwd", cust_pwd);
		System.out.println(">>>> cust_id : " + cust_id + ", cust_pwd : " + cust_pwd);
		int user = ss.selectOne("mini_project.login", map);
		ss.close();
		System.out.println("uer" + user);
		return user;
	}
	/*아이디찾기*/
	public static String userFindId(String cust_name,String cust_phone) {
		SqlSession ss = DBService.getFactory().openSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("cust_name", cust_name);
		map.put("cust_phone", cust_phone);
		String id = ss.selectOne("mini_project.userFindId", map);
		ss.close();
		System.out.println("id" + id);
		return id;
	}
	/*비밀번호찾기*/
	public static String userFindPwd(String cust_id, String cust_name,String cust_phone) {
		SqlSession ss = DBService.getFactory().openSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("cust_id", cust_id);
		map.put("cust_name", cust_name);
		map.put("cust_phone", cust_phone);
		String pwd = ss.selectOne("mini_project.userFindPwd", map);
		ss.close();
		System.out.println("pwd" + pwd);
		return pwd;
	}
}
