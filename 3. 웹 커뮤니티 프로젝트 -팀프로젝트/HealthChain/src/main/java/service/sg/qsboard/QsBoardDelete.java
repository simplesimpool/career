package service.sg.qsboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.MediInfoBoard;
import model.QuestionBoard;
import model.dao.MediInfoBoardDao;
import model.dao.QuestionBoardCmt2Dao;
import model.dao.QuestionBoardCmtDao;
import model.dao.QuestionBoardDao;

public class QsBoardDelete implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		QuestionBoardDao qsbDao = QuestionBoardDao.getInstance();
		QuestionBoard qsb = qsbDao.select(request.getParameter("id"));
		QuestionBoardCmtDao qsbCmtDao = QuestionBoardCmtDao.getInstance();
		QuestionBoardCmt2Dao qsbCmt2Dao = QuestionBoardCmt2Dao.getInstance();
		
		qsb.setQsb_del("y");
		qsbCmtDao.deleteTreeByQsbId(request.getParameter("id"));
		qsbCmt2Dao.deleteTreeByQsbId(request.getParameter("id"));
		
		int result = 0;
		result = qsbDao.update(qsb);
		
		request.setAttribute("result", result);
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("fdURL", "qsBoardDelete.sg");
		return "/view/questionBoard/qsBoardDeleteResult.jsp";
	}
}
