package com.order.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.order.model.Customer;
import com.order.model.Ordeer;
import com.order.service.OrdeerService;

@Controller
@Scope("prototype")
public class OrdeerAction extends ActionSupport implements SessionAware{
	/**
	 * 
	 */
	private static final long serialVersionUID = 32184575931897903L;
	@Autowired
	private OrdeerService ordeerService;
	private Ordeer ordeer;
	private Map<String,Object> result;
	private Map<String,Object> session;
	
	/**
	 * ��Ӷ���
	 */
	public String placeOrder(){
		int customer_id = (int)session.get("customer_id");
		Customer customer = new Customer();
		customer.setId(customer_id);
		ordeer.setCustomer(customer);
		int status = ordeerService.add(ordeer);
		
		//����json����
		result = new HashMap<String, Object>();
		result.put("status", status);
		return "json";
	}
	
	public String updateStatus(){
		int status = ordeer.getStatus();
		int code = ordeerService.updateStatus(ordeer,status);
		String msg = "";
		//������Ҫ�ı��status���msg
		switch(status){
			case 0:msg="��ȡ���˵�,������Ϊδ�ӵ�״̬";break;
			case 1:msg="�ѽӵ�!";break;
			case -1:msg="�����˵�!";break;
			case 99:msg="��ȷ���ʹ�!";break;
		}
		result = new HashMap<String, Object>();
		if(code==0)
			msg = "�����ѱ�ȡ��";
		result.put("code",code);
		result.put("msg", msg);
		
		return "json";
	}
	
	public String delete(){
		int code = ordeerService.delete(ordeer);
		result = new HashMap<String, Object>();
		result.put("code", code);
		return "json";
	}
	
	public Ordeer getOrdeer() {
		return ordeer;
	}
	public void setOrdeer(Ordeer ordeer) {
		this.ordeer = ordeer;
	}
	public Map<String,Object> getResult() {
		return result;
	}
	public void setResult(Map<String,Object> result) {
		this.result = result;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	
}
