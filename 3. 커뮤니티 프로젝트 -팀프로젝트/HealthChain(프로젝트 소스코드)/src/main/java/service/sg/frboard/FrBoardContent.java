package service.sg.frboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.FreeBoard;
import model.Users;
import model.dao.FreeBoardDao;
import model.dao.UsersDao;

public class FrBoardContent implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		FreeBoardDao frbDao = FreeBoardDao.getInstance();
		FreeBoard frb = frbDao.select(request.getParameter("id"));
		UsersDao userDao = UsersDao.getInstance();
		
		frb.setFrb_view_cnt(frb.getFrb_view_cnt() + 1);
		frbDao.update(frb);
		Users user = userDao.select(frb.getUser_id());
		
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("frb", frb);
		request.setAttribute("user", user);
		request.setAttribute("fdURL", "frBoardContent.sg");
		return "/view/freeBoard/frBoardContent.jsp";
	}
}
