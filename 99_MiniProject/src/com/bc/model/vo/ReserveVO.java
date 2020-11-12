package com.bc.model.vo;


public class ReserveVO {
	private int rev_no, hotel_no, cust_no, rev_room_no, rev_price, rev_exist, rev_people;
	private String rev_in, rev_out, rev_name, rev_email, rev_phone;
	

	public ReserveVO() {
		super();
	}

	public ReserveVO(int rev_no, int hotel_no, int cust_no, int rev_room_no, 
			int rev_price, int rev_exist, int rev_people,
			String rev_in, String rev_out, String rev_name, String rev_email, String rev_phone) {
		super();
		this.rev_no = rev_no;
		this.hotel_no = hotel_no;
		this.cust_no = cust_no;
		this.rev_room_no = rev_room_no;
		this.rev_price = rev_price;
		this.rev_exist = rev_exist;
		this.rev_people = rev_people;
		this.rev_in = rev_in;
		this.rev_out = rev_out;
		this.rev_name = rev_name;
		this.rev_email = rev_email;
		this.rev_phone = rev_phone;
	}

	public int getRev_no() {
		return rev_no;
	}

	public void setRev_no(int rev_no) {
		this.rev_no = rev_no;
	}

	public int getHotel_no() {
		return hotel_no;
	}

	public void setHotel_no(int hotel_no) {
		this.hotel_no = hotel_no;
	}

	public int getCust_no() {
		return cust_no;
	}

	public void setCust_no(int cust_no) {
		this.cust_no = cust_no;
	}

	public int getRev_room_no() {
		return rev_room_no;
	}

	public void setRev_room_no(int rev_room_no) {
		this.rev_room_no = rev_room_no;
	}

	public int getRev_price() {
		return rev_price;
	}

	public void setRev_price(int rev_price) {
		this.rev_price = rev_price;
	}

	public int getRev_exist() {
		return rev_exist;
	}

	public void setRev_exist(int rev_exist) {
		this.rev_exist = rev_exist;
	}
	
	public int getRev_people() {
		return rev_people;
	}

	public void setRev_people(int rev_people) {
		this.rev_people = rev_people;
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

	public String getRev_name() {
		return rev_name;
	}

	public void setRev_name(String rev_name) {
		this.rev_name = rev_name;
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
				+ rev_room_no + ", rev_price=" + rev_price + ", rev_exist=" + rev_exist + ", rev_people=" + rev_people
				+ ", rev_in=" + rev_in + ", rev_out=" + rev_out + ", rev_name=" + rev_name + ", rev_email=" + rev_email
				+ ", rev_phone=" + rev_phone + "]";
	}

	
}