package com.bc.model.Rvo;

public class QnaVO {
	
	public String qna_no;
	public String cust_no;
	public String qna_title;
	public String qna_content;
	public String qna_pwd;
	public String cust_name;
	public String qna_type;
	public String cust_phone;

	
	public QnaVO(String qna_no, String qna_title, String qna_content, String qna_type,
			String cust_phone) {
		super();
		this.qna_no = qna_no;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_type = qna_type;
		this.cust_phone = cust_phone;
	}
	
	

	public QnaVO(String qna_no, String qna_title, String qna_content, String cust_name, String qna_type,
			String cust_phone) {
		super();
		this.qna_no = qna_no;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.cust_name = cust_name;
		this.qna_type = qna_type;
		this.cust_phone = cust_phone;
	}



	public QnaVO() {}

	public QnaVO(String qna_no, String cust_no, String qna_title, String qna_content, String qna_pwd, 
				String cust_name, String qna_type, String cust_phone) {
		super();
		this.qna_no = qna_no;
		this.cust_no = cust_no;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_pwd = qna_pwd;
		this.cust_name = cust_name;
		this.qna_type = qna_type;
		this.cust_phone = cust_phone;
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

	public String getCust_name() {
		return cust_name;
	}

	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
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
		return "QnaVO [qna_no=" + qna_no + ", cust_no=" + cust_no + ", qna_title=" + qna_title + ", qna_content="
				+ qna_content + ", qna_pwd=" + qna_pwd + ", cust_name=" + cust_name + ", qna_type=" + qna_type
				+ ", cust_phone=" + cust_phone + "]";
	}


	
	
	

	
	
	
	
	
	
	
	
	
}
