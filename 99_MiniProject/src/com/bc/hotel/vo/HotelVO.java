package com.bc.hotel.vo;

public class HotelVO {
	private int hotel_no;
	private String hotel_name;
	private String hotel_tel;
	private String hotel_addr;
	private String hotel_image;
	
	
	private int room_no;
	private String room_name;
	private String room_content;
	private int room_price;
	private int room_people;
	private int room_spa;
	private int room_cooking;
	private int room_smoking;
	private String room_image;
	
	
	public String getRoom_image() {
		return room_image;
	}
	public void setRoom_image(String room_image) {
		this.room_image = room_image;
	}
	public String getHotel_image() {
		return hotel_image;
	}
	public void setHotel_image(String hotel_image) {
		this.hotel_image = hotel_image;
	}
	
	public int getRoom_stock() {
		return room_stock;
	}
	public void setRoom_stock(int room_stock) {
		this.room_stock = room_stock;
	}
	private int room_stock;
	
	
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getRoom_content() {
		return room_content;
	}
	public void setRoom_content(String room_content) {
		this.room_content = room_content;
	}
	public int getRoom_price() {
		return room_price;
	}
	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}
	public int getRoom_people() {
		return room_people;
	}
	public void setRoom_people(int room_people) {
		this.room_people = room_people;
	}
	public int getRoom_spa() {
		return room_spa;
	}
	public void setRoom_spa(int room_spa) {
		this.room_spa = room_spa;
	}
	public int getRoom_cooking() {
		return room_cooking;
	}
	public void setRoom_cooking(int room_cooking) {
		this.room_cooking = room_cooking;
	}
	public int getRoom_smoking() {
		return room_smoking;
	}
	public void setRoom_smoking(int room_smoking) {
		this.room_smoking = room_smoking;
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
	@Override
	public String toString() {
		return "HotelVO [hotel_no=" + hotel_no + ", hotel_name=" + hotel_name + ", hotel_tel=" + hotel_tel
				+ ", hotel_addr=" + hotel_addr + ", hotel_image=" + hotel_image + ", room_no=" + room_no
				+ ", room_name=" + room_name + ", room_content=" + room_content + ", room_price=" + room_price
				+ ", room_people=" + room_people + ", room_spa=" + room_spa + ", room_cooking=" + room_cooking
				+ ", room_smoking=" + room_smoking + ", room_stock=" + room_stock + "]";
	}
	
	
	
}
