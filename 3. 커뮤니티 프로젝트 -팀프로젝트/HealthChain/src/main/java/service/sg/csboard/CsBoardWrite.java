package service.sg.csboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.service.CommandProcess;
import model.CustomerService;
import model.dao.CustomerServiceDao;

public class CsBoardWrite implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		String userId = (String)session.getAttribute("userId");
		
		CustomerServiceDao csDao = CustomerServiceDao.getInstance();
		CustomerService cs = new CustomerService();
		
		cs.setCs_title(request.getParameter("title"));
		cs.setCs_content(request.getParameter("content"));
		cs.setUser_id(userId);
		
		int result = 0;
		result = csDao.insert(cs);
		
		if (userId.equals("admin")) {
			request.setAttribute("page", 1);
		} else {
			int noticeCnt = csDao.getTotalByNotice();
			int page = noticeCnt / csDao.getPagingData(0, 0).getLimitBoardNum() + 1;
			request.setAttribute("page", page);
		}
		
		request.setAttribute("result", result);
		request.setAttribute("fdURL", "csBoardWrite.sg");
		return "/view/customerService/csBoardWriteResult.jsp";
	}
}
