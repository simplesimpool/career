package com.bookmarket.app.mapper.sg;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.dto.sg.OrderSG;

@Mapper
public interface OrderMapperSG {
	int insert(OrderSG order);
	OrderSG select(int id);
	int getTotal();
	int getReqOdrTotalByUserId(String userId);
	List<BookSG> getReqOrderBookListByUserId(Map<String, Object> map);
	List<OrderSG> getReqOrderListByUserId(Map<String, Object> map);
	int getAcptedOdrTotalByUserId(String userId);
	List<BookSG> getAcptedOrderBookListByUserId(Map<String, Object> map);
	List<OrderSG> getAcptedOrderListByUserId(Map<String, Object> map);
	int updateByUserId(Map<String, Object> map);
	int getReqOrderTotal();
	List<OrderSG> getReqOrderList(Map<String, Object> map);
	int update(OrderSG order);
	List<BookSG> getZeroStkOrOverReqBookListByOrderId(int orderId);
	int decBooksStockByOrderId(int orderId);
	int getRejectOrderTotalByUserId(String userId);
	List<OrderSG> getRejectOrderListByUserId(Map<String, Object> map);
	List<BookSG> getRejectOrderBookListByUserId(Map<String, Object> map);
}
