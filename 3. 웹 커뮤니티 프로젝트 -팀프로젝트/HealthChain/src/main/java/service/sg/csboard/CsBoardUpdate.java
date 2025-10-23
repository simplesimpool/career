package service.sg.csboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.CustomerService;
import model.dao.CustomerServiceDao;

public class CsBoardUpdate implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		CustomerServiceDao csDao = CustomerServiceDao.getInstance();
		CustomerService cs = csDao.select(request.getParameter("id"));
		
		cs.setCs_title(request.getParameter("title"));
		cs.setCs_content(request.getParameter("content"));
		
		int result = 0;
		result = csDao.update(cs);
		
		request.setAttribute("result", result);
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("fdURL", "csBoardUpdate.sg");
		return "/view/customerService/csBoardUpdateResult.jsp";
	}
}
