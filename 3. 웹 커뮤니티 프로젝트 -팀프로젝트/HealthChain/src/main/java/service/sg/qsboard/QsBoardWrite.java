package service.sg.qsboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.service.CommandProcess;
import model.MediInfoBoard;
import model.QuestionBoard;
import model.dao.MediInfoBoardDao;
import model.dao.QuestionBoardDao;

public class QsBoardWrite implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		String userId = (String)session.getAttribute("userId");
		
		QuestionBoardDao qsbDao = QuestionBoardDao.getInstance();
		QuestionBoard mib = new QuestionBoard();
		mib.setUser_id(userId);
		mib.setQsb_title(request.getParameter("title"));
		mib.setQsb_content(request.getParameter("content"));
		
		int result = 0;
		result = qsbDao.insert(mib);
		
		if (userId.equals("admin")) {
			request.setAttribute("page", 1);
		} else {
			int noticeCnt = qsbDao.getNoticeTotal();
			int page = noticeCnt / qsbDao.getPagingData(0, 0).getLimitBoardNum() + 1;
			request.setAttribute("page", page);
		}
		
		request.setAttribute("result", result);
		request.setAttribute("fdURL", "qsBoardWrite.sg");
		return "/view/questionBoard/qsBoardWriteResult.jsp";
	}
}
