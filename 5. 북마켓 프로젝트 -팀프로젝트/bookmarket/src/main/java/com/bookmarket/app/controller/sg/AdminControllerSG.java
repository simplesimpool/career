package com.bookmarket.app.controller.sg;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.dto.sg.OrderDetailSG;
import com.bookmarket.app.dto.sg.OrderSG;
import com.bookmarket.app.dto.sg.PagingData;
import com.bookmarket.app.service.sg.AdminServiceSG;

import jakarta.servlet.http.HttpSession;
import oracle.jdbc.proxy.annotation.Post;

@Controller
public class AdminControllerSG {
	@Autowired
	private AdminServiceSG adminService;

	@GetMapping("/admin/order/requestOrders")
	public String getRequestOrders(@RequestParam("page") int page, Model model, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		if (userId == null || userId.equals("") || !userId.equals("admin")) {
			return "redirect:/";
		}

		int total = adminService.getReqOrderTotal();
		PagingData pgData = new PagingData(total, 5, 5, page);
		List<OrderSG> reqOrderList = adminService.getReqOrderList(pgData);

		model.addAttribute("pgData", pgData);
		model.addAttribute("reqOrderList", reqOrderList);
		return "admin/requestOrders";
	}

	@GetMapping("/admin/order/detail/requestOrder")
	public String getRequestOrderDetail(@ModelAttribute OrderSG reqOrder, @RequestParam("page") int page, Model model, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		if (userId == null || userId.equals("") || !userId.equals("admin")) {
			return "redirect:/";
		}
		
		int total = adminService.getOrderDetailTotalByOrderId(reqOrder.getOrderId());
		PagingData pgData = new PagingData(total, 5, 5, page);
		List<BookSG> orderDetailedBookList = adminService.getOrderDetailedBookListByOrderId(pgData, reqOrder.getOrderId());
		
		model.addAttribute("pgData", pgData);
		model.addAttribute("orderDetailedBookList", orderDetailedBookList);
		model.addAttribute("orderId", reqOrder.getOrderId());
		return "admin/requestOrderDetail";
	}
	
	@PostMapping("/admin/order/approveOrder")
	public String approveOrder(@ModelAttribute OrderSG reqOrder, @RequestParam("page") int page, Model model) {
		int result = 0;
		List<BookSG> zeroStkOrOverReqBookList = adminService.getZeroStkOrOverReqBookListByOrderId(reqOrder.getOrderId());
		
		if (zeroStkOrOverReqBookList.isEmpty()) {
			result = adminService.approveOrderAndDecBooksStockByOrderId(reqOrder.getOrderId());
		} else {
			result = -1;
			model.addAttribute("zeroStkOrOverReqBookList", zeroStkOrOverReqBookList);
		}
		
		int total = adminService.getReqOrderTotal();
		PagingData pgData = new PagingData(total, 5, 5, page);
		
		model.addAttribute("page", pgData.getPage());
		model.addAttribute("result", result);
		return "admin/approveOrderResult";
	}
	
	@PostMapping("/admin/order/rejectOrder")
	public String postMethodName(@ModelAttribute OrderSG reqOrder, @RequestParam("page") int page, Model model) {
		int result = 0;
		
		result = adminService.rejectOrderByOrderId(reqOrder.getOrderId());
		
		int total = adminService.getReqOrderTotal();
		PagingData pgData = new PagingData(total, 5, 5, page);
		
		model.addAttribute("page", pgData.getPage());
		model.addAttribute("result", result);
		return "admin/rejectOrderResult";
	}
}
