package com.bookmarket.app.controller.sg;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.service.sg.BookDetailServiceSG;

@Controller
public class BookDetailControllerSG {
	@Autowired
	private BookDetailServiceSG bookDetailService;

	@GetMapping("/detail/books")
	public String getBookDetailForm(@RequestParam("id") int id, Model model) {
		BookSG book = bookDetailService.getOnSaleTaggedBook(id);
		model.addAttribute("book", book);
		return "bookdetail/bookDetail";
	}
}