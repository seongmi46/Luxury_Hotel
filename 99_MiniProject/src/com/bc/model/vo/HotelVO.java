package com.bc.model.vo;


public class HotelVO {
	private int hotel_no;
	private String hotel_name, hotel_tel, hotel_addr, hotel_image;
	
	public HotelVO() {
		super();
	}
	
	public HotelVO(String hotel_name, String hotel_tel, String hotel_addr, String hotel_image) {
		super();
		this.hotel_name = hotel_name;
		this.hotel_tel = hotel_tel;
		this.hotel_addr = hotel_addr;
		this.hotel_image = hotel_image;
	}

	public HotelVO(int hotel_no, String hotel_name, String hotel_tel, String hotel_addr, String hotel_image) {
		super();
		this.hotel_no = hotel_no;
		this.hotel_name = hotel_name;
		this.hotel_tel = hotel_tel;
		this.hotel_addr = hotel_addr;
		this.hotel_image = hotel_image;
	}

	public int getHotel_no() {
		return hotel_no;
	}

	public void setHotel_no(int hotel_no) {
		this.hotel_no = hotel_no;
	}

	public String getHotel_name() {
		return hotel_name;
	}

	public void setHotel_name(String hotel_name) {
		this.hotel_name = hotel_name;
	}

	public String getHotel_tel() {
		return hotel_tel;
	}

	public void setHotel_tel(String hotel_tel) {
		this.hotel_tel = hotel_tel;
	}

	public String getHotel_addr() {
		return hotel_addr;
	}

	public void setHotel_addr(String hotel_addr) {
		this.hotel_addr = hotel_addr;
	}

	public String getHotel_image() {
		return hotel_image;
	}

	public void setHotel_image(String hotel_image) {
		this.hotel_image = hotel_image;
	}

	@Override
	public String toString() {
		return "HotelVO [hotel_no=" + hotel_no + ", hotel_name=" + hotel_name + ", hotel_tel=" + hotel_tel
				+ ", hotel_addr=" + hotel_addr + ", hotel_image=" + hotel_image + "]";
	}
	
	
	
}
