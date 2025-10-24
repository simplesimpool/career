package com.bookmarket.app.mapper.sw;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import com.bookmarket.app.dto.sw.BookSW;
import com.bookmarket.app.dto.sw.BookSellRequestSW;

@Mapper
public interface BookMapperSW {

	int insertBook(Map<String, Object> map);



	
}

	

