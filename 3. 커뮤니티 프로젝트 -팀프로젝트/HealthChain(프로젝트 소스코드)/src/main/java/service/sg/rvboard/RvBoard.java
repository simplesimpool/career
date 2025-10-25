package service.sg.rvboard;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.PagingData;
import model.ReviewBoard;
import model.Users;
import model.dao.ReviewBoardDao;
import model.dao.UsersDao;

public class RvBoard implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		String order = request.getParameter("order");
		
		ReviewBoardDao rvbDao = ReviewBoardDao.getInstance();
		UsersDao userDao = UsersDao.getInstance();
		PagingData pgData = null;
		List<ReviewBoard> boardList = new ArrayList<ReviewBoard>();
		List<Users> userList = new ArrayList<Users>();
		
		if (page == null) {
			if (order.equals("new")) {
				pgData = rvbDao.getPagingData(1, rvbDao.getTotal());
				
				int startIdx = pgData.getLimitBoardNum() * (pgData.getPage() - 1);
		        int endIdx = pgData.getLimitBoardNum() * pgData.getPage() - 1;
		        if(endIdx >= 0) {
		        	boardList = rvbDao.getBoardListByDate(startIdx, endIdx);
		        }
		        
		        for(ReviewBoard board : boardList) {
		        	Users user = userDao.select(board.getUser_id());
		        	userList.add(user);
		        }
			} else {
				pgData = rvbDao.getPagingData(1, rvbDao.getTotal());
				
				int startIdx = pgData.getLimitBoardNum() * (pgData.getPage() - 1);
		        int endIdx = pgData.getLimitBoardNum() * pgData.getPage() - 1;
		        if(endIdx >= 0) {
		        	boardList = rvbDao.getBoardListByLike(startIdx, endIdx);
		        }
		        
		        for(ReviewBoard board : boardList) {
		        	Users user = userDao.select(board.getUser_id());
		        	userList.add(user);
		        }
			}
		} else {//page 가 널이 아닐떄
			if (order.equals("new")) {
				int p = Integer.parseInt(page);
				pgData = rvbDao.getPagingData(p, rvbDao.getTotal());
				
				if(p > pgData.getMaxPage()) {//요청 폐이지가 최대 페이지수를 넘어갈때
					request.setAttribute("order", request.getParameter("order"));
					request.setAttribute("page", pgData.getMaxPage());
					return "/view/reviewBoard/rvBoardRedirect.jsp";
				} else if(p < 1) {//요청 페이지가 최소페이지수 즉, 1보다 작을 떄
					request.setAttribute("order", request.getParameter("order"));
					request.setAttribute("page", 1);
					return "/view/reviewBoard/rvBoardRedirect.jsp";
				}
				
				int startIdx = pgData.getLimitBoardNum() * (pgData.getPage() - 1);
		        int endIdx = pgData.getLimitBoardNum() * pgData.getPage() - 1;
		        if(endIdx >= 0) {
		        	boardList = rvbDao.getBoardListByDate(startIdx, endIdx);
		        }
		        
		        for(ReviewBoard board : boardList) {
		        	Users user = userDao.select(board.getUser_id());
		        	userList.add(user);
		        }
			} else {
				int p = Integer.parseInt(page);
				pgData = rvbDao.getPagingData(p, rvbDao.getTotal());
				
				if(p > pgData.getMaxPage()) {//요청 폐이지가 최대 페이지수를 넘어갈때
					request.setAttribute("order", request.getParameter("order"));
					request.setAttribute("page", pgData.getMaxPage());
					return "/view/reviewBoard/rvBoardRedirect.jsp";
				} else if(p < 1) {//요청 페이지가 최소페이지수 즉, 1보다 작을 떄
					request.setAttribute("order", request.getParameter("order"));
					request.setAttribute("page", 1);
					return "/view/reviewBoard/rvBoardRedirect.jsp";
				}
				
				int startIdx = pgData.getLimitBoardNum() * (pgData.getPage() - 1);
		        int endIdx = pgData.getLimitBoardNum() * pgData.getPage() - 1;
		        if(endIdx >= 0) {
		        	boardList = rvbDao.getBoardListByLike(startIdx, endIdx);
		        }
		        
		        for(ReviewBoard board : boardList) {
		        	Users user = userDao.select(board.getUser_id());
		        	userList.add(user);
		        }
			}
		}
		
		
		request.setAttribute("order", order);
		request.setAttribute("pgData", pgData);
		request.setAttribute("boardList", boardList);
		request.setAttribute("userList", userList);
		request.setAttribute("fdURL", "rvBoard.sg");
		return "/view/reviewBoard/rvBoard.jsp";
	}
}
