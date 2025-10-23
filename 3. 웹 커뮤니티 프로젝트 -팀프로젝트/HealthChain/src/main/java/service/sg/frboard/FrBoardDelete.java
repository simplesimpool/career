package service.sg.frboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.FreeBoard;
import model.dao.FreeBoardCmtDao;
import model.dao.FreeBoardDao;

public class FrBoardDelete implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		FreeBoardDao frbDao = FreeBoardDao.getInstance();
		FreeBoard frb = frbDao.select(request.getParameter("id"));
		FreeBoardCmtDao frbCmtDao = FreeBoardCmtDao.getInstance();
		
		frb.setFrb_del("y");
		frbCmtDao.deleteTreeByFrbId(request.getParameter("id"));
		
		int result = 0;
		result = frbDao.update(frb);
		
		request.setAttribute("result", result);
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("fdURL", "frBoardDelete.sg");
		return "/view/freeBoard/frBoardDeleteResult.jsp";
	}
}
