package service.sg.adminpage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;

public class AdminPageController implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		if (request.getParameter("category").equals("userList")) {
			request.setAttribute("category", "userList");
			request.setAttribute("fdURL", "adminPageController.sg");
		} else if (request.getParameter("category").equals("noticeList")) {
			request.setAttribute("category", "noticeList");
			request.setAttribute("fdURL", "adminPageController.sg");
		} else if (request.getParameter("category").equals("csReplyList")) {
			request.setAttribute("category", "csReplyList");
			request.setAttribute("fdURL", "adminPageController.sg");
		} else { //리퀘스트 카테고리 오류 포워딩 전용 (아직안함)
			
		}
		
		return "/view/adminPage/adminPageController.jsp";
	}
}
