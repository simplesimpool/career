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

public class MiBoardUpdateForm implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		MediInfoBoardDao mibDao = MediInfoBoardDao.getInstance();
		MediInfoBoard mib = mibDao.select(request.getParameter("id"));
		UsersDao userDao = UsersDao.getInstance();
		Users user = userDao.select(mib.getUser_id());
		
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("mib", mib);
		request.setAttribute("user", user);
		request.setAttribute("fdURL", "miBoardUpdateForm.sg");
		return "/view/mediInfoBoard/miBoardUpdateForm.jsp";
	}
}
