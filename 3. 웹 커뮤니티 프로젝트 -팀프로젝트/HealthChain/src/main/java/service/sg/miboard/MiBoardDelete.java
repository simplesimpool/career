package service.sg.miboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.FreeBoard;
import model.MediInfoBoard;
import model.dao.FreeBoardDao;
import model.dao.MediInfoBoardDao;

public class MiBoardDelete implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		MediInfoBoardDao mibDao = MediInfoBoardDao.getInstance();
		MediInfoBoard mib = mibDao.select(request.getParameter("id"));
		mib.setMib_del("y");
		
		int result = 0;
		result = mibDao.update(mib);
		
		request.setAttribute("result", result);
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("fdURL", "miBoardDelete.sg");
		return "/view/mediInfoBoard/miBoardDeleteResult.jsp";
	}
}
