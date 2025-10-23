package service.sg.rvboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.ReviewBoard;
import model.dao.ReviewBoardCmtDao;
import model.dao.ReviewBoardDao;

public class RvBoardDelete implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		ReviewBoardDao rvbDao = ReviewBoardDao.getInstance();
		ReviewBoard rvb = rvbDao.select(request.getParameter("id"));
		ReviewBoardCmtDao rvbCmtDao = ReviewBoardCmtDao.getInstance();
		
		rvb.setRvb_del("y");
		rvbCmtDao.deleteTreeByRvbId(request.getParameter("id"));
		
		int result = 0;
		result = rvbDao.update(rvb);
		
		request.setAttribute("result", result);
		request.setAttribute("order", request.getParameter("order"));
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("fdURL", "rvBoardDelete.sg");
		return "/view/reviewBoard/rvBoardDeleteResult.jsp";
	}
}
