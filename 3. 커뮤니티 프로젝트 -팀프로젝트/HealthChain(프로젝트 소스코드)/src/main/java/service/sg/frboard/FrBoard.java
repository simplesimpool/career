package service.sg.frboard;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.CustomerService;
import model.FreeBoard;
import model.PagingData;
import model.Users;
import model.dao.FreeBoardDao;
import model.dao.UsersDao;

public class FrBoard implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		
		FreeBoardDao frbDao = FreeBoardDao.getInstance();
		UsersDao userDao = UsersDao.getInstance();
		PagingData pgData = null;
		List<FreeBoard> boardList = new ArrayList<FreeBoard>();
		List<Users> userList = new ArrayList<Users>();
		
		if(page == null) {//처음 게시판 눌렀을떄
			pgData = frbDao.getPagingData(1, frbDao.getTotal());
			
			int startIdx = pgData.getLimitBoardNum() * (pgData.getPage() - 1);
	        int endIdx = pgData.getLimitBoardNum() * pgData.getPage() - 1;
	        if(endIdx >= 0) {
	        	boardList = frbDao.getBoardList(startIdx, endIdx);
	        }
	        
	        for(FreeBoard board : boardList) {
	        	Users user = userDao.select(board.getUser_id());
	        	userList.add(user);
	        }
			
		} else {//페이지 눌렀을 떄
			int p = Integer.parseInt(page);
			pgData = frbDao.getPagingData(p, frbDao.getTotal());
			
			if(p > pgData.getMaxPage()) {//요청 폐이지가 최대 페이지수를 넘어갈때
				request.setAttribute("page", pgData.getMaxPage());
				return "/view/freeBoard/frBoardRedirect.jsp";
			} else if(p < 1) {//요청 페이지가 최소페이지수 즉, 1보다 작을 떄
				request.setAttribute("page", 1);
				return "/view/freeBoard/frBoardRedirect.jsp";
			}
			
			int startIdx = pgData.getLimitBoardNum() * (pgData.getPage() - 1);
	        int endIdx = pgData.getLimitBoardNum() * pgData.getPage() - 1;
	        if(endIdx >= 0) {
	        	boardList = frbDao.getBoardList(startIdx, endIdx);
	        }
	        
	        for(FreeBoard board : boardList) {
	        	Users user = userDao.select(board.getUser_id());
	        	userList.add(user);
	        }
		}
		
		request.setAttribute("pgData", pgData);
		request.setAttribute("boardList", boardList);
		request.setAttribute("userList", userList);
		request.setAttribute("fdURL", "frBoard.sg");
		return "/view/freeBoard/frBoard.jsp";
	}
}
