package com.bookmarket.app.mapper.sg;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.dto.sg.OrderDetailSG;

@Mapper
public interface OrderDetailMapperSG {
	int insertBooks(Map<String, Object> map);
	int getTotalByOrderId(int orderId);
	List<OrderDetailSG> getOrderDetailListByOrderId(Map<String, Object> map);
	List<BookSG> getOrderDetailedBookListByOrderId(Map<String, Object> map);
}
