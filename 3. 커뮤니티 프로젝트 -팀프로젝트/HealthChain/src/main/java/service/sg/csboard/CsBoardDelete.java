package service.sg.csboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.CustomerService;
import model.dao.CustomerServiceDao;

public class CsBoardDelete implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		CustomerServiceDao csDao = CustomerServiceDao.getInstance();
		
		int result = 0;
		result = csDao.deleteTree(request.getParameter("id"));
		
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("result", result);
		request.setAttribute("fdURL", "csBoardDelete.sg");
		return "/view/customerService/csBoardDeleteResult.jsp";
	}
}
