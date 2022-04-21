package com.beans;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class Orders {
	
	private int orderid;
	private int userid;
	private String totalprice;
	private String amount;
	private String date;
	private Boolean deliverycheck;
	
	
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(String totalprice) {
		this.totalprice = totalprice;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}

	public Boolean getDeliverycheck() {
		return deliverycheck;
	}
	public void setDeliverycheck(Boolean deliverycheck) {
		this.deliverycheck = deliverycheck;
	}
	
}