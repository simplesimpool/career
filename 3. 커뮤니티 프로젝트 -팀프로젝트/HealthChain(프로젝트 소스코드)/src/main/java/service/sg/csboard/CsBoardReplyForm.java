package service.sg.csboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.CustomerService;
import model.Users;
import model.dao.CustomerServiceDao;
import model.dao.UsersDao;

public class CsBoardReplyForm implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		CustomerServiceDao csDao = CustomerServiceDao.getInstance();
		UsersDao userDao = UsersDao.getInstance();
		CustomerService cs = csDao.select(request.getParameter("id"));
		Users user = userDao.select(cs.getUser_id());
		
		request.setAttribute("cs", cs);
		request.setAttribute("user", user);
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("fdURL", "csBoardReplyForm.sg");
		return "/view/customerService/csBoardReplyForm.jsp";
	}
}
