package cn.com.order.pojo;

public class OrderItem {

	private Integer oiid;
	private Integer count;
	private double subtotal;
	private int pid;
	private Integer oid;
	private Integer uid;
	
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getOiid() {
		return oiid;
	}
	public void setOiid(Integer oiid) {
		this.oiid = oiid;
	}
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
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	@Override
	public String toString() {
		return "OrderItem [oiid=" + oiid + ", count=" + count + ", subtotal=" + subtotal + ", pid=" + pid + ", oid="
				+ oid + ", uid=" + uid + "]";
	}
	
}
