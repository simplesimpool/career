package com.bookmarket.app.service.sg;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.dto.sg.OrderDetailSG;
import com.bookmarket.app.dto.sg.OrderSG;
import com.bookmarket.app.dto.sg.PagingData;
import com.bookmarket.app.mapper.sg.OrderDetailMapperSG;
import com.bookmarket.app.mapper.sg.OrderMapperSG;

@Service("AdminServiceImplSG")
public class AdminServiceImplSG implements AdminServiceSG {
	@Autowired
	private OrderMapperSG orderMapper;
	
	@Autowired
	private OrderDetailMapperSG orderDetailMapper;
	
	@Override
	public int getReqOrderTotal() {
		return orderMapper.getReqOrderTotal();
	}

	@Override
	public List<OrderSG> getReqOrderList(PagingData pgData) {
		Map<String, Object> map = new HashMap<>();
		map.put("startIdx", pgData.getStartIdx() + 1);
		map.put("endIdx", pgData.getEndIdx() + 1);
		return orderMapper.getReqOrderList(map);
	}

	@Override
	public int getOrderDetailTotalByOrderId(int orderId) {
		return orderDetailMapper.getTotalByOrderId(orderId);
	}

	@Override
	public List<BookSG> getOrderDetailedBookListByOrderId(PagingData pgData, int orderId) {
		Map<String, Object> map = new HashMap<>();
		map.put("startIdx", pgData.getStartIdx() + 1);
		map.put("endIdx", pgData.getEndIdx() + 1);
		map.put("orderId", orderId);
		return orderDetailMapper.getOrderDetailedBookListByOrderId(map);
	}

	@Override
	public OrderSG selectOrder(int id) {
		return orderMapper.select(id);
	}

	@Override
	public int updateOrder(OrderSG order) {
		return orderMapper.update(order);
	}

	@Override
	public List<BookSG> getZeroStkOrOverReqBookListByOrderId(int orderId) {
		return orderMapper.getZeroStkOrOverReqBookListByOrderId(orderId);
	}

	@Override
	@Transactional
	public int approveOrderAndDecBooksStockByOrderId(int orderId) {
		int result = 0;
		
		OrderSG order = orderMapper.select(orderId);
		order.setOrderConfirm("y");
		result += orderMapper.update(order);
		result += orderMapper.decBooksStockByOrderId(orderId);
		
		return result;
	}

	@Override
	@Transactional
	public int rejectOrderByOrderId(int orderId) {
		int result = 0;
		
		OrderSG order = orderMapper.select(orderId);
		order.setOrderReject("y");
		result = orderMapper.update(order);
		
		return result;
	}
}
