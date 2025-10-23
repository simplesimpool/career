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

public class MiBoardWriteForm implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("fdURL", "miBoardWriteForm.sg");
		return "/view/mediInfoBoard/miBoardWriteForm.jsp";
	}
}
