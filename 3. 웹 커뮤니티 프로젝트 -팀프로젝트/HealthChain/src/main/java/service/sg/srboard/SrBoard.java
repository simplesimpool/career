package service.sg.srboard;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.PagingData;
import model.SearchBoard;
import model.Users;
import model.dao.CustomerServiceDao;
import model.dao.FreeBoardDao;
import model.dao.MediInfoBoardDao;
import model.dao.QuestionBoardDao;
import model.dao.ReviewBoardDao;
import model.dao.SearchBoardDao;
import model.dao.UsersDao;

public class SrBoard implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		String keyWord = request.getParameter("keyWord");
		
		CustomerServiceDao csDao = CustomerServiceDao.getInstance();
		MediInfoBoardDao mibDao = MediInfoBoardDao.getInstance();
		QuestionBoardDao qsbDao = QuestionBoardDao.getInstance();
		FreeBoardDao frbDao = FreeBoardDao.getInstance();
		ReviewBoardDao rvbDao = ReviewBoardDao.getInstance();
		
		SearchBoardDao srbDao = SearchBoardDao.getInstance();
		UsersDao userDao = UsersDao.getInstance();
		PagingData pgData = null;
		
		List<SearchBoard> boardList = new ArrayList<SearchBoard>();
		List<Users> userList = new ArrayList<Users>();
		
		if(page == null) {//처음 게시판 눌렀을떄
			pgData = srbDao.getPagingDataByKeyWord(1, keyWord);
			
			int startIdx = pgData.getLimitBoardNum() * (pgData.getPage() - 1);
	        int endIdx = pgData.getLimitBoardNum() * pgData.getPage() - 1;
	        if(endIdx >= 0) {
	        	boardList = srbDao.getBoardListByKeyWord(startIdx, endIdx, keyWord);
	        }
	        
	        for(SearchBoard board : boardList) {
	        	if(board.getCategory().equals("cs")) {
	        		board.setView_cnt(csDao.select(Integer.toString(board.getId())).getCs_view_cnt());
	        	} else if(board.getCategory().equals("mib")) {
	        		board.setView_cnt(mibDao.select(Integer.toString(board.getId())).getMib_view_cnt());
	        	} else if(board.getCategory().equals("rvb")) {
	        		board.setView_cnt(rvbDao.select(Integer.toString(board.getId())).getRvb_view_cnt());
	        	} else if(board.getCategory().equals("frb")) {
	        		board.setView_cnt(frbDao.select(Integer.toString(board.getId())).getFrb_view_cnt());
	        	} else if(board.getCategory().equals("qsb")) {
	        		board.setView_cnt(qsbDao.select(Integer.toString(board.getId())).getQsb_view_cnt());
	        	}
	        	
	        	Users user = userDao.select(board.getUser_id());
	        	userList.add(user);
	        }
			
		} else {//페이지 눌렀을 떄
			int p = Integer.parseInt(page);
			pgData = srbDao.getPagingDataByKeyWord(p, keyWord);
			
			if(p > pgData.getMaxPage()) {//요청 폐이지가 최대 페이지수를 넘어갈때
				request.setAttribute("page", pgData.getMaxPage());
				request.setAttribute("keyWord", keyWord);
				return "/view/searchBoard/srBoardPageRedirect.jsp";
			} else if(p < 1) {//요청 페이지가 최소페이지수 즉, 1보다 작을 떄
				request.setAttribute("page", 1);
				request.setAttribute("keyWord", keyWord);
				return "/view/searchBoard/srBoardPageRedirect.jsp";
			}
			
			int startIdx = pgData.getLimitBoardNum() * (pgData.getPage() - 1);
	        int endIdx = pgData.getLimitBoardNum() * pgData.getPage() - 1;
	        if(endIdx >= 0) {
	        	boardList = srbDao.getBoardListByKeyWord(startIdx, endIdx, keyWord);
	        }
	        
	        for(SearchBoard board : boardList) {
	        	if(board.getCategory().equals("cs")) {
	        		board.setView_cnt(csDao.select(Integer.toString(board.getId())).getCs_view_cnt());
	        	} else if(board.getCategory().equals("mib")) {
	        		board.setView_cnt(mibDao.select(Integer.toString(board.getId())).getMib_view_cnt());
	        	} else if(board.getCategory().equals("rvb")) {
	        		board.setView_cnt(rvbDao.select(Integer.toString(board.getId())).getRvb_view_cnt());
	        	} else if(board.getCategory().equals("frb")) {
	        		board.setView_cnt(frbDao.select(Integer.toString(board.getId())).getFrb_view_cnt());
	        	} else if(board.getCategory().equals("qsb")) {
	        		board.setView_cnt(qsbDao.select(Integer.toString(board.getId())).getQsb_view_cnt());
	        	}
	        	
	        	Users user = userDao.select(board.getUser_id());
	        	userList.add(user);
	        }
		}
		
		request.setAttribute("pgData", pgData);
		request.setAttribute("boardList", boardList);
		request.setAttribute("userList", userList);
		request.setAttribute("keyWord", keyWord);
		request.setAttribute("fdURL", "srBoard.sg");
		return "/view/searchBoard/srBoard.jsp";
	}
}
