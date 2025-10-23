package service.sg.csboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.CustomerService;
import model.Users;
import model.dao.CustomerServiceDao;
import model.dao.UsersDao;

public class CsBoardContent implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		CustomerServiceDao csDao = CustomerServiceDao.getInstance();
		CustomerService cs = csDao.select(request.getParameter("id"));
		UsersDao userDao = UsersDao.getInstance();
		
		cs.setCs_view_cnt(cs.getCs_view_cnt() + 1);
		csDao.update(cs);
		Users user = userDao.select(cs.getUser_id());
		
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("lvl", request.getParameter("lvl"));
		request.setAttribute("id", request.getParameter("id"));
		request.setAttribute("parentId", request.getParameter("parentId"));
		request.setAttribute("cs", cs);
		request.setAttribute("user", user);
		request.setAttribute("fdURL", "csBoardContent.sg");
		return "/view/customerService/csBoardContent.jsp";
	}
}
