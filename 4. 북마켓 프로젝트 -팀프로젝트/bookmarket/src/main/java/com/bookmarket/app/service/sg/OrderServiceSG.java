package com.bookmarket.app.service.sg;

import java.util.List;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.dto.sg.OrderSG;
import com.bookmarket.app.dto.sg.PagingData;

public interface OrderServiceSG {
	int insert(OrderSG order);
	OrderSG select(int id);
	int getOrderTotal();
	int getReqOdrTotalByUserId(String userId);
	List<BookSG> getReqOrderBookListByUserId(PagingData pgData, String userId);
	List<OrderSG> getReqOrderListByUserId(PagingData pgData, String userId);
	int getAcptedOdrTotalByUserId(String userId);
	List<BookSG> getAcptedOrderBookListByUserId(PagingData pgData, String userId);
	List<OrderSG> getAcptedOrderListByUserId(PagingData pgData, String userId);
	int updateByUserId(OrderSG order, String userId);
	int getRejectOrderTotalByUserId(String userId);
	List<OrderSG> getRejectOrderListByUserId(PagingData pgData, String userId);
	List<BookSG> getRejectOrderBookListByUserId(PagingData pgData, String userId);
}
