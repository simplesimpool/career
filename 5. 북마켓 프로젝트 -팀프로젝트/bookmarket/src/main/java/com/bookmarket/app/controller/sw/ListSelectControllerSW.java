package com.bookmarket.app.controller.sw;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookmarket.app.dto.sw.BookPublisherSW;
import com.bookmarket.app.dto.sw.UserSW;
import com.bookmarket.app.service.sw.BookPublisherServiceSW;
import com.bookmarket.app.service.sw.UserServiceSW;

@Controller
public class ListSelectControllerSW {
	
	@Autowired
	private UserServiceSW uss;
	@Autowired
	private BookPublisherServiceSW bss;


	@GetMapping("/userlist/listSelect")
	public String listSelect(
	    @RequestParam(name = "userPage", defaultValue = "1") int userPage,
	    @RequestParam(name = "pubPage", defaultValue = "1") int pubPage,
	    @RequestParam(name = "withdraw", defaultValue = "false") String withdraw,
	    Model model) {

	    boolean hideWithdrawn = withdraw.equals("true");
	    int pageSize = 10;

	    // 일반회원
	    int userOffset = (userPage - 1) * pageSize;
	    List<UserSW> userList = uss.getUserList(userOffset, pageSize, hideWithdrawn);
	    int userTotal = uss.getUserCount(hideWithdrawn);
	    int userTotalPages = (int) Math.ceil((double) userTotal / pageSize);

	    // 출판사 회원
	    int pubOffset = (pubPage - 1) * pageSize;
	    List<BookPublisherSW> pubList = bss.getPubList(pubOffset, pageSize, hideWithdrawn);
	    int pubTotal = bss.getPubCount(hideWithdrawn);
	    int pubTotalPages = (int) Math.ceil((double) pubTotal / pageSize);

	    // 전달
	    model.addAttribute("userList", userList);
	    model.addAttribute("pubList", pubList);
	    model.addAttribute("userPage", userPage);
	    model.addAttribute("userTotalPages", userTotalPages);
	    model.addAttribute("pubPage", pubPage);
	    model.addAttribute("pubTotalPages", pubTotalPages);
	    model.addAttribute("withdraw", withdraw);

	    return "userlist/listSelect";
	}

	
	

}
