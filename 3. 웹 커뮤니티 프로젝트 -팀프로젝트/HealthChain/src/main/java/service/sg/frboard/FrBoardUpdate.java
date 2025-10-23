package service.sg.frboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.FreeBoard;
import model.dao.FreeBoardDao;

public class FrBoardUpdate implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		FreeBoardDao frbDao = FreeBoardDao.getInstance();
		FreeBoard frb = frbDao.select(request.getParameter("id"));
		frb.setFrb_title(request.getParameter("title"));
		frb.setFrb_content(request.getParameter("content"));
		
		int result = 0;
		result = frbDao.update(frb);
		
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("result", result);
		request.setAttribute("fdURL", "frBoardUpdate.sg");
		return "/view/freeBoard/frBoardUpdateResult.jsp";
	}
}
