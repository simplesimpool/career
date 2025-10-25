package service.sg.frboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.service.CommandProcess;
import model.FreeBoard;
import model.dao.FreeBoardDao;

public class FrBoardWrite implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		String userId = (String)session.getAttribute("userId");
		
		FreeBoardDao frbDao = FreeBoardDao.getInstance();
		FreeBoard frb = new FreeBoard();
		frb.setUser_id(userId);
		frb.setFrb_title(request.getParameter("title"));
		frb.setFrb_content(request.getParameter("content"));
		
		int result = 0;
		result = frbDao.insert(frb);
		
		if (userId.equals("admin")) {
			request.setAttribute("page", 1);
		} else {
			int noticeCnt = frbDao.getNoticeTotal();
			int page = noticeCnt / frbDao.getPagingData(0, 0).getLimitBoardNum() + 1;
			request.setAttribute("page", page);
		}
		
		request.setAttribute("result", result);
		request.setAttribute("fdURL", "frBoardWrite.sg");
		return "/view/freeBoard/frBoardWriteResult.jsp";
	}
}
