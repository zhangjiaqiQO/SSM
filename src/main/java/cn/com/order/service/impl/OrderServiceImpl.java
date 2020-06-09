package cn.com.order.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.order.mapper.OrderMapper;
import cn.com.order.pojo.Order;
import cn.com.order.pojo.OrderItem;
import cn.com.order.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderMapper orderMapper;
	
	// 保存订单项
	@Override
	public void saveOrderItem(OrderItem orderItem) {
		orderMapper.saveOrderItem( orderItem );
	}

	// 查询用户的所有订单
	public List<OrderItem> selectAllOrderItemByUid(Integer uid) {
		return orderMapper.selectAllOrderItemByUid( uid );
	}

	@Override
	public void removeOrderItem(int oiid) {
		orderMapper.removeOrderItem( oiid );
	}

	@Override
	public void removeAllOrderItem(Integer uid) {
		orderMapper.removeAllOrderItem( uid );
	}

	@Override
	public OrderItem selectOrderItemByUidAndPid(Integer uid, int pid) {
		Map<String,Integer> upid = new HashMap<String,Integer>();
		upid.put("uid", uid);
		upid.put("pid", pid);
		return orderMapper.selectOrderItemByUidAndPid( upid );
	}

	// 保存订单，返回保存订单的id
	@Override
	public int saveOrder(Order newOrder) {
		orderMapper.saveOrder( newOrder );
		return newOrder.getOid();
	}

	// 更新订单项所属的订单
	public void updateOrderItem(int orderId, Integer oiid) {
		Map<String,Integer> oi = new HashMap<String,Integer>();
		oi.put("orderId", orderId);
		oi.put("oiid", oiid);
		orderMapper.updateOrderItem( oi );
	}

	public List<Order> selectOrderAndOrderItemAndProduct() {
		return orderMapper.selectOrderAndOrderItemAndProduct();
	}

	@Override
	public List<Order> selectOrderAndOrderItemAndProductByUid(int uid) {
		return orderMapper.selectOrderAndOrderItemAndProductByUid( uid );
	}
	
	@Override
	public List<Order> selectOrdersByState(int paystate) {
		return orderMapper.selectOrdersByState( paystate );
	}


	

	
	
}
