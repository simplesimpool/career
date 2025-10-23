package com.bookmarket.app.service.sg;

import java.util.List;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.dto.sg.PagingData;

public interface BookRestServiceSG {
	Boolean incBookRcdCnt(int bookId);
	BookSG select(int bookId);
	int getByKwOnSaleTaggedBookTotal(String keyword);
	List<BookSG> getByKwOnSaleTaggedBooks(PagingData pgData, String keyword);
}
