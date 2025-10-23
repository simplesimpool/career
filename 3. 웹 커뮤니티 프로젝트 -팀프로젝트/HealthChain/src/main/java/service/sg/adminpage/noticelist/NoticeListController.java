package service.sg.adminpage.noticelist;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;

public class NoticeListController implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("boardCategory", request.getParameter("boardCategory"));
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("fdURL", "noticeListController.sg");
		//if the page parameter is added, it will remained and can send it to the each of services.
		//but if remove the page parameter, each selection will lead the page to 1.
		return "/view/adminPage/noticeList/noticeListController.jsp";
	}
}
