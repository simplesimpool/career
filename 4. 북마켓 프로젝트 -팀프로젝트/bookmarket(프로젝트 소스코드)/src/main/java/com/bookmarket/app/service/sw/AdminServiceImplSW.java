package com.bookmarket.app.service.sw;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookmarket.app.dto.sw.BookSW;
import com.bookmarket.app.dto.sw.BookSellRequestSW;
import com.bookmarket.app.mapper.sw.AdminMapperSW;

@Service
public class AdminServiceImplSW implements AdminServiceSW {

	@Autowired
	AdminMapperSW ams;

	@Override
	public List<BookSW> getlist() {
		
		return ams.getlist();
	}

	@Override
	public int approveBook(int bsrId) {
		
		return ams.approveBook(bsrId);
	}

	@Override
	public int rejectBook(Map<String, Object> param) {
		
		return ams.rejectBook(param);
	}
	
	
}
