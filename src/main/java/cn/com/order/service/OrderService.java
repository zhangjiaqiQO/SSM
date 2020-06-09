package cn.com.order.service;

import java.util.List;

import cn.com.order.pojo.Order;
import cn.com.order.pojo.OrderItem;

public interface OrderService {

	void saveOrderItem(OrderItem orderItem);

	List<OrderItem> selectAllOrderItemByUid(Integer uid);

	void removeOrderItem(int oiid);

	void removeAllOrderItem(Integer uid);

	OrderItem selectOrderItemByUidAndPid(Integer uid, int pid);

	int saveOrder(Order newOrder);

	void updateOrderItem(int orderId, Integer oiid);

	List<Order> selectOrderAndOrderItemAndProduct();
	List<Order> selectOrderAndOrderItemAndProductByUid( int uid );
	
	List<Order> selectOrdersByState(int paystate);



}
