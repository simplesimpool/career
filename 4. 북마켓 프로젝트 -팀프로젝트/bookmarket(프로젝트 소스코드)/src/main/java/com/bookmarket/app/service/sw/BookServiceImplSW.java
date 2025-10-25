package com.bookmarket.app.service.sw;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookmarket.app.dto.sw.BookSW;
import com.bookmarket.app.dto.sw.BookSellRequestSW;
import com.bookmarket.app.mapper.sw.BookMapperSW;
import com.bookmarket.app.mapper.sw.BookSellRequestMapperSW;


@Service
public class BookServiceImplSW implements BookServiceSW {

	@Autowired
	private BookMapperSW bms;

	@Override
	public int insertBook(Map<String, Object> map) {
		
		return bms.insertBook(map);
	}



}
