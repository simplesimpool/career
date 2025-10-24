package service.sg.csboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.service.CommandProcess;
import model.CustomerService;
import model.dao.CustomerServiceDao;

public class CsBoardReply implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		CustomerServiceDao csDao = CustomerServiceDao.getInstance();
		
		CustomerService cs = new CustomerService();
		
		cs.setUser_id((String)session.getAttribute("userId"));
		cs.setCs_title(request.getParameter("title"));
		cs.setCs_content(request.getParameter("content"));
		cs.setCs_level(Integer.parseInt(request.getParameter("lvl")));
		cs.setCs_parent_id(Integer.parseInt(request.getParameter("parentId")));
		
		int result = 0;
		result = csDao.reply(cs);
		
		int index = csDao.getIndex(request.getParameter("parentId"));
		int limitBoardNum = csDao.getPagingData(0, 0).getLimitBoardNum();
		
		if ((index + 1) % limitBoardNum == 0) {
			request.setAttribute("page", Integer.parseInt(request.getParameter("page")) + 1);
		} else {
			request.setAttribute("page", request.getParameter("page"));
		}
		
		request.setAttribute("result", result);
		request.setAttribute("fdURL", "csBoardReply.sg");
		return "/view/customerService/csBoardReplyResult.jsp";
	}
}
