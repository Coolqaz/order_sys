package com.order.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Ordeer {
	private int id;
	private Customer customer;
	private Shop shop;
	private Food food;
	private Date orderTime;
	private Date arriveTime;
	private String remarks;
	private int type;
	/**
	 * ����״̬�룺0Ϊδ�ӵ�,1Ϊ�ѽӵ�,-1Ϊ�˵���,99Ϊ���ʹ�,100Ϊ���ʹ��ұ����۹�
	 */
	private int status;
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@ManyToOne
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	@ManyToOne
	public Shop getShop() {
		return shop;
	}
	public void setShop(Shop shop) {
		this.shop = shop;
	}
	
	public String getOrderTime() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy��MM��dd�� HH:mm:ss");
		return simpleDateFormat.format(orderTime);
	}
	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Date getArriveTime() {
		return arriveTime;
	}
	public void setArriveTime(Date arriveTime) {
		this.arriveTime = arriveTime;
	}
	@OneToOne
	public Food getFood() {
		return food;
	}
	public void setFood(Food food) {
		this.food = food;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	
}
