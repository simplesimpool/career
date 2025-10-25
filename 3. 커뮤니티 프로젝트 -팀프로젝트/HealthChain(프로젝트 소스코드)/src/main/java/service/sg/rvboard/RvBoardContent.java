package service.sg.rvboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.ReviewBoard;
import model.Users;
import model.dao.ReviewBoardDao;
import model.dao.UsersDao;

public class RvBoardContent implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		ReviewBoardDao rvbDao = ReviewBoardDao.getInstance();
		ReviewBoard rvb = rvbDao.select(request.getParameter("id"));
		UsersDao userDao = UsersDao.getInstance();
		
		rvb.setRvb_view_cnt(rvb.getRvb_view_cnt() + 1);
		rvbDao.update(rvb);
		Users user = userDao.select(rvb.getUser_id());
		
		request.setAttribute("order", request.getParameter("order"));
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("rvb", rvb);
		request.setAttribute("user", user);
		request.setAttribute("fdURL", "rvBoardContent.sg");
		return "/view/reviewBoard/rvBoardContent.jsp";
	}
}
