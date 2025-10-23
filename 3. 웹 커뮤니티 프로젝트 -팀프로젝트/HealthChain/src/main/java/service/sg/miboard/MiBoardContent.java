package service.sg.miboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.FreeBoard;
import model.MediInfoBoard;
import model.Users;
import model.dao.FreeBoardDao;
import model.dao.MediInfoBoardDao;
import model.dao.UsersDao;

public class MiBoardContent implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		MediInfoBoardDao mibDao = MediInfoBoardDao.getInstance();
		MediInfoBoard mib = mibDao.select(request.getParameter("id"));
		UsersDao userDao = UsersDao.getInstance();
		
		mib.setMib_view_cnt(mib.getMib_view_cnt() + 1);
		mibDao.update(mib);
		Users user = userDao.select(mib.getUser_id());
		
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("mib", mib);
		request.setAttribute("user", user);
		request.setAttribute("fdURL", "miBoardContent.sg");
		return "/view/mediInfoBoard/miBoardContent.jsp";
	}
}
