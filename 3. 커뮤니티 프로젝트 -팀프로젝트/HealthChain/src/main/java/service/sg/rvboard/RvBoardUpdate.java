package service.sg.rvboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.ReviewBoard;
import model.dao.ReviewBoardDao;

public class RvBoardUpdate implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		ReviewBoardDao rvbDao = ReviewBoardDao.getInstance();
		ReviewBoard rvb = rvbDao.select(request.getParameter("id"));
		rvb.setRvb_title(request.getParameter("title"));
		rvb.setRvb_content(request.getParameter("content"));
		
		int result = 0;
		result = rvbDao.update(rvb);
		
		request.setAttribute("order", request.getParameter("order"));
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("result", result);
		request.setAttribute("fdURL", "rvBoardUpdate.sg");
		return "/view/reviewBoard/rvBoardUpdateResult.jsp";
	}
}
