package service.sg.rvboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.service.CommandProcess;
import model.ReviewBoard;
import model.dao.ReviewBoardDao;

public class RvBoardWrite implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		String userId = (String)session.getAttribute("userId");
		
		ReviewBoardDao rvbDao = ReviewBoardDao.getInstance();
		ReviewBoard rvb =  new ReviewBoard();
		rvb.setUser_id(userId);
		rvb.setRvb_title(request.getParameter("title"));
		rvb.setRvb_content(request.getParameter("content"));
		
		int result = 0;
		result = rvbDao.insert(rvb);
		
		if (userId.equals("admin")) {
			request.setAttribute("page", 1);
		} else {
			int noticeCnt = rvbDao.getNoticeTotal();
			int page = noticeCnt / rvbDao.getPagingData(0, 0).getLimitBoardNum() + 1;
			request.setAttribute("page", page);
		}
		
		request.setAttribute("result", result);
		request.setAttribute("order", request.getParameter("order"));
		request.setAttribute("fdURL", "rvBoardWrite.sg");
		return "/view/reviewBoard/rvBoardWriteResult.jsp";
	}
}
