package service.sg.rvboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.ReviewBoard;
import model.Users;
import model.dao.ReviewBoardDao;
import model.dao.UsersDao;

public class RvBoardUpdateForm implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		ReviewBoardDao rvbDao = ReviewBoardDao.getInstance();
		ReviewBoard rvb = rvbDao.select(request.getParameter("id"));
		UsersDao userDao = UsersDao.getInstance();
		Users user = userDao.select(rvb.getUser_id());
		
		request.setAttribute("order", request.getParameter("order"));
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("rvb", rvb);
		request.setAttribute("user", user);
		request.setAttribute("fdURL", "rvBoardUpdateForm.sg");
		return "/view/reviewBoard/rvBoardUpdateForm.jsp";
	}
}
