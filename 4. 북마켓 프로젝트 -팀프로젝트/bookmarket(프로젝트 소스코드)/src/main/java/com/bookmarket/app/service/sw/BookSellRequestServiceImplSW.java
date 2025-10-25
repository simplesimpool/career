package com.bookmarket.app.service.sw;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookmarket.app.mapper.sw.BookSellRequestMapperSW;

@Service
public class BookSellRequestServiceImplSW implements BookSellRequestServiceSW {

	@Autowired
	BookSellRequestMapperSW bms;
	
	@Override
	public List<Map<String, Object>> myRequests(Integer pubId) {
		// TODO Auto-generated method stub
		return bms.myRequests(pubId);
	}

}
