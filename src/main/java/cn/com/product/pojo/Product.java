package cn.com.product.pojo;

import java.util.Date;

public class Product {

	private int pid;
	private String pname;
	private Double market_price;
	private Double shop_price;
	private String imagelocation;
	private String description;
	private int hot;
	private Date date;
	
	// 一级二级分类的外键
	private Integer caid;
	private Integer cbid;
	
	// 根据用户、订单、订单项查询出的商品数量和总金额
	// 应该有更好的方法，暂时想不出来，先这么整吧
	private Integer count;
	private double subtotal;
	
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}
	public int getHot() {
		return hot;
	}
	public void setHot(int hot) {
		this.hot = hot;
	}
	public int getCaid() {
		return caid;
	}
	public void setCaid(Integer caid) {
		this.caid = caid;
	}
	public int getCbid() {
		return cbid;
	}
	public void setCbid(Integer cbid) {
		this.cbid = cbid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Double getMarket_price() {
		return market_price;
	}
	public void setMarket_price(Double market_price) {
		this.market_price = market_price;
	}
	public Double getShop_price() {
		return shop_price;
	}
	public void setShop_price(Double shop_price) {
		this.shop_price = shop_price;
	}
	public String getImagelocation() {
		return imagelocation;
	}
	public void setImagelocation(String imagelocation) {
		this.imagelocation = imagelocation;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Product [pid=" + pid + ", pname=" + pname + ", market_price=" + market_price + ", shop_price="
				+ shop_price + ", imagelocation=" + imagelocation + ", description=" + description + ", hot=" + hot
				+ ", date=" + date + ", caid=" + caid + ", cbid=" + cbid + ", count=" + count + ", subtotal=" + subtotal
				+ "]";
	}
	
	
	
	
	
}
