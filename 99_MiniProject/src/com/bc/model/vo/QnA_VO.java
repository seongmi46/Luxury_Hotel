package com.bc.model.vo;

public class QnA_VO {
	private int qna_no, cust_no;
	private String qna_title, qna_content, qna_pwd, 
				   qna_type, cust_phone;
	public QnA_VO() {
		super();
	}
	public QnA_VO(int qna_no, int cust_no, String qna_title, String qna_content, String qna_pwd, String qna_type,
			String cust_phone) {
		super();
		this.qna_no = qna_no;
		this.cust_no = cust_no;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_pwd = qna_pwd;
		this.qna_type = qna_type;
		this.cust_phone = cust_phone;
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
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_pwd() {
		return qna_pwd;
	}
	public void setQna_pwd(String qna_pwd) {
		this.qna_pwd = qna_pwd;
	}
	public String getQna_type() {
		return qna_type;
	}
	public void setQna_type(String qna_type) {
		this.qna_type = qna_type;
	}
	public String getCust_phone() {
		return cust_phone;
	}
	public void setCust_phone(String cust_phone) {
		this.cust_phone = cust_phone;
	}
	@Override
	public String toString() {
		return "QnA_VO [qna_no=" + qna_no + ", cust_no=" + cust_no + ", qna_title=" + qna_title + ", qna_content="
				+ qna_content + ", qna_pwd=" + qna_pwd + ", qna_type=" + qna_type + ", cust_phone=" + cust_phone + "]";
	}
	
	
}
