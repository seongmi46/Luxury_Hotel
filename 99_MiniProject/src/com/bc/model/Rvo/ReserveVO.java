package com.bc.model.Rvo;

public class ReserveVO {
	public String rev_no;
	public String hotel_no;
	public String cust_no;
	public String rev_room_no;
	public String rev_in;
	public String rev_out;
	public String rev_price;
	public String rev_exist;
	public String rev_name;
	
	// 호텔 이름, 고객이름 만들기
	public String hotel_name;
	public String cust_name;
	
	// 예약이메일, 전화번호 만들기
	public String rev_email;
	public String rev_phone;
	
	
	public ReserveVO() {}


	public ReserveVO(String rev_no, String hotel_no, String cust_no, String rev_room_no, String rev_in, String rev_out,
			String rev_price, String rev_exist, String rev_name, String hotel_name, String cust_name, String rev_email, String rev_phone) {
		super();
		this.rev_no = rev_no;
		this.hotel_no = hotel_no;
		this.cust_no = cust_no;
		this.rev_room_no = rev_room_no;
		this.rev_in = rev_in;
		this.rev_out = rev_out;
		this.rev_price = rev_price;
		this.rev_exist = rev_exist;
		this.rev_name = rev_name;
		this.hotel_name = hotel_name;
		this.cust_name = cust_name;
		this.rev_email = rev_email;
		this.rev_phone = rev_phone;
	}
	
	


	public ReserveVO(String rev_no, String rev_name, String rev_email, String rev_phone) {
		super();
		this.rev_no = rev_no;
		this.rev_name = rev_name;
		this.rev_email = rev_email;
		this.rev_phone = rev_phone;
	}
	
	


	public String getRev_no() {
		return rev_no;
	}


	public void setRev_no(String rev_no) {
		this.rev_no = rev_no;
	}


	public String getHotel_no() {
		return hotel_no;
	}


	public void setHotel_no(String hotel_no) {
		this.hotel_no = hotel_no;
	}


	public String getCust_no() {
		return cust_no;
	}


	public void setCust_no(String cust_no) {
		this.cust_no = cust_no;
	}


	public String getRev_room_no() {
		return rev_room_no;
	}


	public void setRev_room_no(String rev_room_no) {
		this.rev_room_no = rev_room_no;
	}


	public String getRev_in() {
		return rev_in;
	}


	public void setRev_in(String rev_in) {
		this.rev_in = rev_in;
	}


	public String getRev_out() {
		return rev_out;
	}


	public void setRev_out(String rev_out) {
		this.rev_out = rev_out;
	}


	public String getRev_price() {
		return rev_price;
	}


	public void setRev_price(String rev_price) {
		this.rev_price = rev_price;
	}


	public String getRev_exist() {
		return rev_exist;
	}


	public void setRev_exist(String rev_exist) {
		this.rev_exist = rev_exist;
	}


	public String getRev_name() {
		return rev_name;
	}


	public void setRev_name(String rev_name) {
		this.rev_name = rev_name;
	}


	public String getHotel_name() {
		return hotel_name;
	}


	public void setHotel_name(String hotel_name) {
		this.hotel_name = hotel_name;
	}


	public String getCust_name() {
		return cust_name;
	}


	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}


	public String getRev_email() {
		return rev_email;
	}


	public void setRev_email(String rev_email) {
		this.rev_email = rev_email;
	}


	public String getRev_phone() {
		return rev_phone;
	}


	public void setRev_phone(String rev_phone) {
		this.rev_phone = rev_phone;
	}


	@Override
	public String toString() {
		return "ReserveVO [rev_no=" + rev_no + ", hotel_no=" + hotel_no + ", cust_no=" + cust_no + ", rev_room_no="
				+ rev_room_no + ", rev_in=" + rev_in + ", rev_out=" + rev_out + ", rev_price=" + rev_price
				+ ", rev_exist=" + rev_exist + ", rev_name=" + rev_name + ", hotel_name=" + hotel_name + ", cust_name="
				+ cust_name + ", rev_email=" + rev_email + ", rev_phone=" + rev_phone + "]";
	}

	
	

	
	
	
	
	
	
	
	
	
}
