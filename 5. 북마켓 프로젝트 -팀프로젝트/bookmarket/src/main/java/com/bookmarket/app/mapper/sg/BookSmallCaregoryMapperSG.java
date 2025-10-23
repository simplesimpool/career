package com.bookmarket.app.mapper.sg;

import org.apache.ibatis.annotations.Mapper;

import com.bookmarket.app.dto.sg.BookSmallCaregorySG;

@Mapper
public interface BookSmallCaregoryMapperSG {
	BookSmallCaregorySG select(int id);
}
