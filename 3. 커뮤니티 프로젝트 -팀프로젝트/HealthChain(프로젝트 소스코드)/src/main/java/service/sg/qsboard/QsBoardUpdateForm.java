package service.sg.qsboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.MediInfoBoard;
import model.QuestionBoard;
import model.Users;
import model.dao.MediInfoBoardDao;
import model.dao.QuestionBoardDao;
import model.dao.UsersDao;

public class QsBoardUpdateForm implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		QuestionBoardDao qsbDao = QuestionBoardDao.getInstance();
		QuestionBoard qsb = qsbDao.select(request.getParameter("id"));
		UsersDao userDao = UsersDao.getInstance();
		Users user = userDao.select(qsb.getUser_id());
		
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("qsb", qsb);
		request.setAttribute("user", user);
		request.setAttribute("fdURL", "qsBoardUpdateForm.sg");
		return "/view/questionBoard/qsBoardUpdateForm.jsp";
	}
}
