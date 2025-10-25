package service.sg.qsboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.MediInfoBoard;
import model.QuestionBoard;
import model.dao.MediInfoBoardDao;
import model.dao.QuestionBoardDao;

public class QsBoardUpdate implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		QuestionBoardDao qsbDao = QuestionBoardDao.getInstance();
		QuestionBoard qsb = qsbDao.select(request.getParameter("id"));
		qsb.setQsb_title(request.getParameter("title"));
		qsb.setQsb_content(request.getParameter("content"));
		
		int result = 0;
		result = qsbDao.update(qsb);
		
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("result", result);
		request.setAttribute("fdURL", "qsBoardUpdate.sg");
		return "/view/questionBoard/qsBoardUpdateResult.jsp";
	}
}
