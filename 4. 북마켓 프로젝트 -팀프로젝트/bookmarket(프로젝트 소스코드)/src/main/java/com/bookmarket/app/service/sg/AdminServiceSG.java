package com.bookmarket.app.service.sg;

import java.util.List;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.dto.sg.OrderDetailSG;
import com.bookmarket.app.dto.sg.OrderSG;
import com.bookmarket.app.dto.sg.PagingData;

public interface AdminServiceSG {
	int getReqOrderTotal();
	List<OrderSG> getReqOrderList(PagingData pgData);
	int getOrderDetailTotalByOrderId(int orderId);
	List<BookSG> getOrderDetailedBookListByOrderId(PagingData pgData, int orderId);
	OrderSG selectOrder(int id);
	int updateOrder(OrderSG order);
	List<BookSG> getZeroStkOrOverReqBookListByOrderId(int orderId);
	int approveOrderAndDecBooksStockByOrderId(int orderId);
	int rejectOrderByOrderId(int orderId);
}
