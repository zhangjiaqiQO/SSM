package cn.com.order.mapper;

import java.util.List;
import java.util.Map;

import cn.com.order.pojo.Order;
import cn.com.order.pojo.OrderItem;

public interface OrderMapper {

	void saveOrderItem(OrderItem orderItem);

	List<OrderItem> selectAllOrderItemByUid(Integer uid);

	void removeOrderItem(int oiid);

	void removeAllOrderItem(Integer uid);

	OrderItem selectOrderItemByUidAndPid(Map<String, Integer> upid);

	int saveOrder(Order newOrder);

	void updateOrderItem(Map<String, Integer> oi);

	List<Order> selectOrderAndOrderItemAndProduct();
	List<Order> selectOrderAndOrderItemAndProductByUid(int uid);

	List<Order> selectOrdersByState(int paystate);


	

	


}
