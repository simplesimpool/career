package com.bookmarket.app.service.sw;

import java.util.List;
import java.util.Map;

import com.bookmarket.app.dto.sw.BookSW;

public interface AdminServiceSW {

	List<BookSW> getlist();
	int approveBook(int bsrId);
	int rejectBook(Map<String, Object> param);

}
