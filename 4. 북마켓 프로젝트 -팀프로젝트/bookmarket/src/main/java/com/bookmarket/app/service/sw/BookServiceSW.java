package com.bookmarket.app.service.sw;

import java.util.Map;

import com.bookmarket.app.dto.sw.BookSW;
import com.bookmarket.app.dto.sw.BookSellRequestSW;

public interface BookServiceSW {

	int insertBook(Map<String, Object> map);


}
