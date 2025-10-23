package service.sg.adminpage.noticelist;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.service.CommandProcess;
import model.PagingData;
import model.SearchBoard;
import model.dao.SearchBoardDao;
import model.dao.UsersDao;

public class AllNoticeList implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		SearchBoardDao srbDao = SearchBoardDao.getInstance();
		PagingData pgData = null;
		List<SearchBoard> boardList = new ArrayList<SearchBoard>();
		
		if(request.getParameter("page") == null || request.getParameter("page").equals("")) {
			pgData = srbDao.getPagingData(1, srbDao.getNoticeTotal());
			
			request.setAttribute("boardCategory", request.getParameter("boardCategory"));
			request.setAttribute("page", 1);
			return "/view/adminPage/noticeList/noticeListController.jsp";
		} else {//페이지 눌렀을 때
			int p = Integer.parseInt(request.getParameter("page"));
			pgData = srbDao.getPagingData(p, srbDao.getNoticeTotal());
			
			if(p > pgData.getMaxPage()) {//요청 폐이지가 최대 페이지수를 넘어갈때
				request.setAttribute("boardCategory", request.getParameter("boardCategory"));
				request.setAttribute("page", pgData.getMaxPage());
				return "/view/adminPage/noticeList/noticeListController.jsp";
			} else if(p < 1) {//요청 페이지가 최소페이지수 즉, 1보다 작을 떄
				request.setAttribute("boardCategory", request.getParameter("boardCategory"));
				request.setAttribute("page", 1);
				return "/view/adminPage/noticeList/noticeListController.jsp";
			}
			
			int startIdx = pgData.getLimitBoardNum() * (pgData.getPage() - 1);
	        int endIdx = pgData.getLimitBoardNum() * pgData.getPage() - 1;
	        
	        if(endIdx >= 0) {
	        	boardList = srbDao.getBoardListByNotice(startIdx, endIdx);
	        }
		}
		
		request.setAttribute("pgData", pgData);
		request.setAttribute("boardList", boardList);
		request.setAttribute("boardCategory", request.getParameter("boardCategory"));
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("fdURL", "allNoticeList.sg");
		return "/view/adminPage/noticeList/noticeList.jsp";
	}
}
