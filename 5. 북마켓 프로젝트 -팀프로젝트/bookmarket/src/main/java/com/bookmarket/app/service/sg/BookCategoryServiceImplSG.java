package com.bookmarket.app.service.sg;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.dto.sg.BookSmallCaregorySG;
import com.bookmarket.app.dto.sg.PagingData;
import com.bookmarket.app.mapper.sg.BookMapperSG;
import com.bookmarket.app.mapper.sg.BookSmallCaregoryMapperSG;

@Service("BookCategoryServiceImplSG")
public class BookCategoryServiceImplSG implements BookCategoryServiceSG {
	@Autowired
	private BookMapperSG bookMapper;
	
	@Autowired
	private BookSmallCaregoryMapperSG bookSmallCategoryMapper;
	
	@Override
	public int getCategoryBookTotal(int bscId) {
		return bookMapper.getCategoryBookTotal(bscId);
	}

	@Override
	public List<BookSG> getCategoryBookList(PagingData pgData, int bscId) {
		Map<String, Object> map = new HashMap<>();
		map.put("startIdx", pgData.getStartIdx() + 1);
		map.put("endIdx", pgData.getEndIdx() + 1);
		map.put("bscId", bscId);
		
		return bookMapper.getCategoryBookList(map);
	}

	@Override
	public String getBookSmallCategoryNameById(int bscId) {
		BookSmallCaregorySG bsc = bookSmallCategoryMapper.select(bscId);
		
		return bsc.getBscName();
	}
}
