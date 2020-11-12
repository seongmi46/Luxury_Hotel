package com.bc.controller.K;

public class CustomerVO {
	private String cust_no,cust_name,cust_id,cust_pwd,cust_phone,
	cust_email,cust_exist,cust_birth;
	
	public CustomerVO() {
	}

	public CustomerVO(String cust_no, String cust_name, String cust_id, String cust_pwd, String cust_phone,
			String cust_email, String cust_exist, String cust_birth) {
		super();
		this.cust_no = cust_no;
		this.cust_name = cust_name;
		this.cust_id = cust_id;
		this.cust_pwd = cust_pwd;
		this.cust_phone = cust_phone;
		this.cust_email = cust_email;
		this.cust_exist = cust_exist;
		this.cust_birth = cust_birth;
	}

	public String getCust_no() {
		return cust_no;
	}

	public void setCust_no(String cust_no) {
		this.cust_no = cust_no;
	}

	public String getCust_name() {
		return cust_name;
	}

	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}

	public String getCust_id() {
		return cust_id;
	}

	public void setCust_id(String cust_id) {
		this.cust_id = cust_id;
	}

	public String getCust_pwd() {
		return cust_pwd;
	}

	public void setCust_pwd(String cust_pwd) {
		this.cust_pwd = cust_pwd;
	}

	public String getCust_phone() {
		return cust_phone;
	}

	public void setCust_phone(String cust_phone) {
		this.cust_phone = cust_phone;
	}

	public String getCust_email() {
		return cust_email;
	}

	public void setCust_email(String cust_email) {
		this.cust_email = cust_email;
	}

	public String getCust_exist() {
		return cust_exist;
	}

	public void setCust_exist(String cust_exist) {
		this.cust_exist = cust_exist;
	}



	public String getCust_birth() {
		return cust_birth;
	}

	public void setCust_birth(String cust_birth) {
		this.cust_birth = cust_birth;
	}


	@Override
	public String toString() {
		return "CustomerVO [cust_no=" + cust_no + ", cust_name=" + cust_name + ", cust_id=" + cust_id + ", cust_pwd="
				+ cust_pwd + ", cust_phone=" + cust_phone + ", cust_email=" + cust_email + ", cust_exist=" + cust_exist
				+ ", cust_birth=" + cust_birth + "]";
	}



	
}
