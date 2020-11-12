package com.bc.model.Rvo;

public class QnaAnsVO {
	
	public String qna_no;
	public String cust_no;
	public String ans_content;
	public String ans_no;
	
	
	public QnaAnsVO() {}


	public QnaAnsVO(String qna_no, String cust_no, String ans_content, String ans_no) {
		super();
		this.qna_no = qna_no;
		this.cust_no = cust_no;
		this.ans_content = ans_content;
		this.ans_no = ans_no;
	}


	public String getQna_no() {
		return qna_no;
	}


	public void setQna_no(String qna_no) {
		this.qna_no = qna_no;
	}


	public String getCust_no() {
		return cust_no;
	}


	public void setCust_no(String cust_no) {
		this.cust_no = cust_no;
	}


	public String getAns_content() {
		return ans_content;
	}


	public void setAns_content(String ans_content) {
		this.ans_content = ans_content;
	}


	public String getAns_no() {
		return ans_no;
	}


	public void setAns_no(String ans_no) {
		this.ans_no = ans_no;
	}


	@Override
	public String toString() {
		return "QnaAnsVO [qna_no=" + qna_no + ", cust_no=" + cust_no + ", ans_content=" + ans_content + ", ans_no="
				+ ans_no + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
}
