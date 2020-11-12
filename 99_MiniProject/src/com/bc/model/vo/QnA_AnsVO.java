package com.bc.model.vo;

public class QnA_AnsVO {
	private int ans_no, qna_no, cust_no;
	private String ans_content;
	
	public QnA_AnsVO() {
		super();
	}
	
	public QnA_AnsVO(int qna_no, int cust_no, String ans_content) {
		super();
		this.qna_no = qna_no;
		this.cust_no = cust_no;
		this.ans_content = ans_content;
	}

	public QnA_AnsVO(int ans_no, int qna_no, int cust_no, String ans_content) {
		super();
		this.ans_no = ans_no;
		this.qna_no = qna_no;
		this.cust_no = cust_no;
		this.ans_content = ans_content;
	}

	public int getAns_no() {
		return ans_no;
	}

	public void setAns_no(int ans_no) {
		this.ans_no = ans_no;
	}

	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public int getCust_no() {
		return cust_no;
	}

	public void setCust_no(int cust_no) {
		this.cust_no = cust_no;
	}

	public String getAns_content() {
		return ans_content;
	}

	public void setAns_content(String ans_content) {
		this.ans_content = ans_content;
	}

	@Override
	public String toString() {
		return "QnA_AnsVO [ans_no=" + ans_no + ", qna_no=" + qna_no + ", cust_no=" + cust_no + ", ans_content="
				+ ans_content + "]";
	}

	
	
}
