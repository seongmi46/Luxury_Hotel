package com.bc.model.vo;

public class RoomVO {
	private int room_no, hotel_no, room_price, room_people, room_stock;
	private String room_name, room_content, room_spa, room_cooking, room_smoking, room_image;

	public RoomVO() {
		super();
	}
	public RoomVO(int room_no, int hotel_no, int room_price, int room_people, int room_stock, String room_name,
			String room_content, String room_spa, String room_cooking, String room_smoking, String room_image) {
		super();
		this.room_no = room_no;
		this.hotel_no = hotel_no;
		this.room_price = room_price;
		this.room_people = room_people;
		this.room_stock = room_stock;
		this.room_name = room_name;
		this.room_content = room_content;
		this.room_spa = room_spa;
		this.room_cooking = room_cooking;
		this.room_smoking = room_smoking;
		this.room_image = room_image;
	}
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	public int getHotel_no() {
		return hotel_no;
	}
	public void setHotel_no(int hotel_no) {
		this.hotel_no = hotel_no;
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
	public int getRoom_stock() {
		return room_stock;
	}
	public void setRoom_stock(int room_stock) {
		this.room_stock = room_stock;
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
	public String getRoom_spa() {
		return room_spa;
	}
	public void setRoom_spa(String room_spa) {
		this.room_spa = room_spa;
	}
	public String getRoom_cooking() {
		return room_cooking;
	}
	public void setRoom_cooking(String room_cooking) {
		this.room_cooking = room_cooking;
	}
	public String getRoom_smoking() {
		return room_smoking;
	}
	public void setRoom_smoking(String room_smoking) {
		this.room_smoking = room_smoking;
	}
	public String getRoom_image() {
		return room_image;
	}
	public void setRoom_image(String room_image) {
		this.room_image = room_image;
	}
	@Override
	public String toString() {
		return "RoomVO [room_no=" + room_no + ", hotel_no=" + hotel_no + ", room_price=" + room_price + ", room_people="
				+ room_people + ", room_stock=" + room_stock + ", room_name=" + room_name + ", room_content="
				+ room_content + ", room_spa=" + room_spa + ", room_cooking=" + room_cooking + ", room_smoking="
				+ room_smoking + ", room_image=" + room_image + "]";
	}
	
}
