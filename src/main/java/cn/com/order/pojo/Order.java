package cn.com.order.pojo;

import java.util.Date;
import java.util.List;

import cn.com.product.pojo.Product;

public class Order {

	private Integer oid;
	private Double total;
	private Date orderdate;
	private Integer paystate;	// 1未支付  2已支付  3确认收货  4订单完成
	private String address;
	private String telephone;
	private int uid;
	
	// 一对多
	// 一个订单下有多个商品
	private List<Product> products;
	// 一个订单下有多个订单项
	private List<OrderItem> orderItems;
	
	public List<OrderItem> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(List<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}
	public List<Product> getProducts() {
		return products;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
	}
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	public Integer getPaystate() {
		return paystate;
	}
	public void setPaystate(Integer paystate) {
		this.paystate = paystate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	@Override
	public String toString() {
		return "Order [oid=" + oid + ", total=" + total + ", orderdate=" + orderdate + ", paystate=" + paystate
				+ ", address=" + address + ", telephone=" + telephone + ", uid=" + uid + ", products=" + products
				+ ", orderItems=" + orderItems + "]";
	}
	
	
	
	
	
	
}
