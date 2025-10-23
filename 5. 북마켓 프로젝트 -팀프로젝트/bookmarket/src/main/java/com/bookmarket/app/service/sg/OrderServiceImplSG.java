package com.bookmarket.app.service.sg;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.dto.sg.OrderSG;
import com.bookmarket.app.dto.sg.PagingData;
import com.bookmarket.app.mapper.sg.OrderMapperSG;

@Service("OrderServiceImplSG")
public class OrderServiceImplSG implements OrderServiceSG {
	@Autowired
	private OrderMapperSG orderMapper;
	
	@Override
	public int insert(OrderSG order) {
		return orderMapper.insert(order);
	}

	@Override
	public OrderSG select(int id) {
		return orderMapper.select(id);
	}

	@Override
	public int getOrderTotal() {
		return orderMapper.getTotal();
	}

	@Override
	public int getReqOdrTotalByUserId(String userId) {
		return orderMapper.getReqOdrTotalByUserId(userId);
	}

	@Override
	public List<BookSG> getReqOrderBookListByUserId(PagingData pgData, String userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("startIdx", pgData.getStartIdx() + 1);
		map.put("endIdx", pgData.getEndIdx() + 1);
		return orderMapper.getReqOrderBookListByUserId(map);
	}

	@Override
	public List<OrderSG> getReqOrderListByUserId(PagingData pgData, String userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("startIdx", pgData.getStartIdx() + 1);
		map.put("endIdx", pgData.getEndIdx() + 1);
		return orderMapper.getReqOrderListByUserId(map);
	}

	@Override
	public int getAcptedOdrTotalByUserId(String userId) {
		return orderMapper.getAcptedOdrTotalByUserId(userId);
	}

	@Override
	public List<BookSG> getAcptedOrderBookListByUserId(PagingData pgData, String userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("startIdx", pgData.getStartIdx() + 1);
		map.put("endIdx", pgData.getEndIdx() + 1);
		return orderMapper.getAcptedOrderBookListByUserId(map);
	}
	
	@Override
	public List<OrderSG> getAcptedOrderListByUserId(PagingData pgData, String userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("startIdx", pgData.getStartIdx() + 1);
		map.put("endIdx", pgData.getEndIdx() + 1);
		return orderMapper.getAcptedOrderListByUserId(map);
	}

	@Override
	@Transactional
	public int updateByUserId(OrderSG order, String userId) {
		order = orderMapper.select(order.getOrderId());
		order.setOrderDel("y");
		
		Map<String, Object> map = new HashMap<>();
		map.put("order", order);
		map.put("userId", userId);
		return orderMapper.updateByUserId(map);
	}

	@Override
	public int getRejectOrderTotalByUserId(String userId) {
		return orderMapper.getRejectOrderTotalByUserId(userId);
	}

	@Override
	public List<OrderSG> getRejectOrderListByUserId(PagingData pgData, String userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("startIdx", pgData.getStartIdx() + 1);
		map.put("endIdx", pgData.getEndIdx() + 1);
		return orderMapper.getRejectOrderListByUserId(map);
	}

	@Override
	public List<BookSG> getRejectOrderBookListByUserId(PagingData pgData, String userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("startIdx", pgData.getStartIdx() + 1);
		map.put("endIdx", pgData.getEndIdx() + 1);
		return orderMapper.getRejectOrderBookListByUserId(map);
	}
}
