package service.sg.mypage.myboard;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.service.CommandProcess;
import model.MediInfoBoard;
import model.PagingData;
import model.Users;
import model.dao.MediInfoBoardDao;
import model.dao.UsersDao;

public class MyMiBoard implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		String userId = (String)session.getAttribute("userId");
		
		MediInfoBoardDao mibDao = MediInfoBoardDao.getInstance();
		PagingData pgData = null;
		List<MediInfoBoard> boardList = new ArrayList<MediInfoBoard>();
		
		if(request.getParameter("page") == null || request.getParameter("page").equals("")) {
			pgData = mibDao.getPagingDataByUserId(1, userId);
			
			request.setAttribute("boardCategory", request.getParameter("boardCategory"));
			request.setAttribute("page", 1);
			return "/view/myPage/myBoard/myBoardController.jsp";
		} else {//페이지 눌렀을 때
			int p = Integer.parseInt(request.getParameter("page"));
			pgData = mibDao.getPagingDataByUserId(p, userId);
			
			if(p > pgData.getMaxPage()) {//요청 폐이지가 최대 페이지수를 넘어갈때
				request.setAttribute("boardCategory", request.getParameter("boardCategory"));
				request.setAttribute("page", pgData.getMaxPage());
				return "/view/myPage/myBoard/myBoardController.jsp";
			} else if(p < 1) {//요청 페이지가 최소페이지수 즉, 1보다 작을 떄
				request.setAttribute("boardCategory", request.getParameter("boardCategory"));
				request.setAttribute("page", 1);
				return "/view/myPage/myBoard/myBoardController.jsp";
			}
			
			int startIdx = pgData.getLimitBoardNum() * (pgData.getPage() - 1);
	        int endIdx = pgData.getLimitBoardNum() * pgData.getPage() - 1;
	        
	        if(endIdx >= 0) {
	        	boardList = mibDao.getBoardListByUserId(startIdx, endIdx, userId);
	        }
		}
		
		request.setAttribute("pgData", pgData);
		request.setAttribute("boardList", boardList);
		request.setAttribute("boardCategory", request.getParameter("boardCategory"));
		request.setAttribute("fdURL", "myMiBoard.sg");
		return "/view/myPage/myBoard/myBoard.jsp";
	}
}
