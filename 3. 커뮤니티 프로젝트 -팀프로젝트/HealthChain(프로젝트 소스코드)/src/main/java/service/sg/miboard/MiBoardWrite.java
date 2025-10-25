package service.sg.miboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.service.CommandProcess;
import model.FreeBoard;
import model.MediInfoBoard;
import model.dao.FreeBoardDao;
import model.dao.MediInfoBoardDao;

public class MiBoardWrite implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		String userId = (String)session.getAttribute("userId");
		
		MediInfoBoardDao mibDao = MediInfoBoardDao.getInstance();
		MediInfoBoard mib = new MediInfoBoard();
		mib.setUser_id(userId);
		mib.setMib_title(request.getParameter("title"));
		mib.setMib_content(request.getParameter("content"));
		
		int result = 0;
		result = mibDao.insert(mib);
		
		if (userId.equals("admin")) {
			request.setAttribute("page", 1);
		} else {
			int noticeCnt = mibDao.getNoticeTotal();
			int page = noticeCnt / mibDao.getPagingData(0, 0).getLimitBoardNum() + 1;
			request.setAttribute("page", page);
		}
		
		request.setAttribute("result", result);
		request.setAttribute("fdURL", "miBoardWrite.sg");
		return "/view/mediInfoBoard/miBoardWriteResult.jsp";
	}
}
