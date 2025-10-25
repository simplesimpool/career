package service.sg.csboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.CustomerService;
import model.Users;
import model.dao.CustomerServiceDao;
import model.dao.UsersDao;

public class CsBoardUpdateForm implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		CustomerServiceDao csDao = CustomerServiceDao.getInstance();
		CustomerService cs = csDao.select(request.getParameter("id"));
		
		UsersDao userDao = UsersDao.getInstance();
		Users user = userDao.select(cs.getUser_id());
		
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("cs", cs);
		request.setAttribute("user", user);
		request.setAttribute("fdURL", "csBoardUpdateForm.sg");
		return "/view/customerService/csBoardUpdateForm.jsp";
	}
}
