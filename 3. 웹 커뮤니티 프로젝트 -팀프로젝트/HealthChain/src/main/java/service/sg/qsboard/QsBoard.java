package service.sg.qsboard;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.MediInfoBoard;
import model.PagingData;
import model.QuestionBoard;
import model.Users;
import model.dao.MediInfoBoardDao;
import model.dao.QuestionBoardDao;
import model.dao.UsersDao;

public class QsBoard implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		
		QuestionBoardDao qsbDao = QuestionBoardDao.getInstance();
		UsersDao userDao = UsersDao.getInstance();
		PagingData pgData = null;
		List<QuestionBoard> boardList = new ArrayList<QuestionBoard>();
		List<Users> userList = new ArrayList<Users>();
		
		if(page == null) {//처음 게시판 눌렀을떄
			pgData = qsbDao.getPagingData(1, qsbDao.getTotal());
			
			int startIdx = pgData.getLimitBoardNum() * (pgData.getPage() - 1);
	        int endIdx = pgData.getLimitBoardNum() * pgData.getPage() - 1;
	        if(endIdx >= 0) {
	        	boardList = qsbDao.getBoardList(startIdx, endIdx);
	        }
	        
	        for(QuestionBoard board : boardList) {
	        	Users user = userDao.select(board.getUser_id());
	        	userList.add(user);
	        }
			
		} else {//페이지 눌렀을 떄
			int p = Integer.parseInt(page);
			pgData = qsbDao.getPagingData(p, qsbDao.getTotal());
			
			if(p > pgData.getMaxPage()) {//요청 폐이지가 최대 페이지수를 넘어갈때
				request.setAttribute("page", pgData.getMaxPage());
				return "/view/questionBoard/qsBoardRedirect.jsp";
			} else if(p < 1) {//요청 페이지가 최소페이지수 즉, 1보다 작을 떄
				request.setAttribute("page", 1);
				return "/view/questionBoard/qsBoardRedirect.jsp";
			}
			
			int startIdx = pgData.getLimitBoardNum() * (pgData.getPage() - 1);
	        int endIdx = pgData.getLimitBoardNum() * pgData.getPage() - 1;
	        if(endIdx >= 0) {
	        	boardList = qsbDao.getBoardList(startIdx, endIdx);
	        }
	        
	        for(QuestionBoard board : boardList) {
	        	Users user = userDao.select(board.getUser_id());
	        	userList.add(user);
	        }
		}
		
		request.setAttribute("pgData", pgData);
		request.setAttribute("boardList", boardList);
		request.setAttribute("userList", userList);
		request.setAttribute("fdURL", "qsBoard.sg");
		return "/view/questionBoard/qsBoard.jsp";
	}
}
