package service.sg.mypage.myboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.CustomerService;
import model.dao.CustomerServiceDao;
import model.dao.FreeBoardDao;
import model.dao.MediInfoBoardDao;
import model.dao.QuestionBoardDao;
import model.dao.ReviewBoardDao;

public class MyBoardContent implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		MediInfoBoardDao mibDao = MediInfoBoardDao.getInstance();
		QuestionBoardDao qsbDao = QuestionBoardDao.getInstance();
		CustomerServiceDao csDao = CustomerServiceDao.getInstance();
		FreeBoardDao frbDao = FreeBoardDao.getInstance();
		ReviewBoardDao rvbDao = ReviewBoardDao.getInstance();
		
		if (request.getParameter("category").equals("mib")) {
			int index = mibDao.getIndex(request.getParameter("id"));
			int page = index / mibDao.getPagingData(0, mibDao.getTotal()).getLimitBoardNum() + 1;//제한 게시글 갯수만 필요함
			request.setAttribute("page", page);
		} else if (request.getParameter("category").equals("qsb")) {
			int index = qsbDao.getIndex(request.getParameter("id"));
			int page = index / qsbDao.getPagingData(0, qsbDao.getTotal()).getLimitBoardNum() + 1;//제한 게시글 갯수만 필요함
			request.setAttribute("page", page);
		} else if (request.getParameter("category").equals("cs")) {
			CustomerService cs = csDao.select(request.getParameter("id"));
			int lvl = cs.getCs_level();
			int parentId = cs.getCs_parent_id();
			int index = csDao.getIndex(request.getParameter("id"));
			int page = index / csDao.getPagingData(0, csDao.getTotal()).getLimitBoardNum() + 1;//제한 게시글 갯수만 필요함
			request.setAttribute("lvl", lvl);
			request.setAttribute("parentId", parentId);
			request.setAttribute("page", page);
		} else if (request.getParameter("category").equals("frb")) {
			int index = frbDao.getIndex(request.getParameter("id"));
			int page = index / frbDao.getPagingData(0, frbDao.getTotal()).getLimitBoardNum() + 1;//제한 게시글 갯수만 필요함
			request.setAttribute("page", page);
		} else if (request.getParameter("category").equals("rvb")) {
			int index = rvbDao.getIndexByDate(request.getParameter("id"));
			int page = index / rvbDao.getPagingData(0, rvbDao.getTotal()).getLimitBoardNum() + 1;//제한 게시글 갯수만 필요함
			request.setAttribute("order", "new");
			request.setAttribute("page", page);
		}
		
		request.setAttribute("id", request.getParameter("id"));
		request.setAttribute("category", request.getParameter("category"));
		request.setAttribute("fdURL", "myBoardContent.sg");
		return "/view/myPage/myBoard/myBoardContentForward.jsp";
	}
}
