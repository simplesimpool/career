package com.bookmarket.app.restcontroller.sg;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.dto.sg.PagingData;
import com.bookmarket.app.service.sg.BookRestServiceSG;

import jakarta.servlet.http.HttpSession;

@RestController
public class BookRestControllerSG {
	@Autowired
	private BookRestServiceSG bookRestService;
	
	@PostMapping("/book/incBookRcdCnt")
	public Map<String, Object> incBookRcdCnt(@RequestBody BookSG reqBook, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		Map<String, Object> map = new HashMap<>();
		
		if (userId.equals("admin")) {
			map.put("isSuccess", false);
			map.put("bookRcdCnt", -1);
		} else {
			Boolean isSuccess = bookRestService.incBookRcdCnt(reqBook.getBookId());
			BookSG book = bookRestService.select(reqBook.getBookId());
			map.put("isSuccess", isSuccess);
			map.put("bookRcdCnt", book.getBookRcdCnt());
		}
		return map;
	}
	
	@PostMapping("/book/getKwdBookNameList")
	public Map<String, Object> getKwdBookNameList(@RequestBody Map<String, String> reqMap) {
		Map<String, Object> map = new HashMap<>();
		List<BookSG> bookNameList = new ArrayList<>();
		
		int byKwOnSaleTaggedBookTotal = bookRestService.getByKwOnSaleTaggedBookTotal(reqMap.get("keyword"));
		PagingData pgData = new PagingData(byKwOnSaleTaggedBookTotal, 5, 1, 1);

		bookNameList = bookRestService.getByKwOnSaleTaggedBooks(pgData, reqMap.get("keyword"));
		
		map.put("bookNameList", bookNameList);
		return map;
	}
}
