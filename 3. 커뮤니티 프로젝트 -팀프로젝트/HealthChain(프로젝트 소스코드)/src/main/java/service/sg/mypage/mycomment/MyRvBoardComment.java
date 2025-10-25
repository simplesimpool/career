package service.sg.mypage.mycomment;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.service.CommandProcess;
import model.FreeBoard;
import model.FreeBoardCmt;
import model.PagingData;
import model.ReviewBoard;
import model.ReviewBoardCmt;
import model.dao.FreeBoardCmtDao;
import model.dao.FreeBoardDao;
import model.dao.ReviewBoardCmtDao;
import model.dao.ReviewBoardDao;

public class MyRvBoardComment implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		String userId = (String)session.getAttribute("userId");
		
		ReviewBoardDao rvbDao = ReviewBoardDao.getInstance();
		ReviewBoardCmtDao rvbCmtDao = ReviewBoardCmtDao.getInstance();
		PagingData pgData = null;
		List<ReviewBoardCmt> commentList = new ArrayList<ReviewBoardCmt>();
		List<ReviewBoard> boardList = new ArrayList<ReviewBoard>();
		
		if (request.getParameter("page") == null || request.getParameter("page").equals("")) {
			pgData = rvbCmtDao.getPagingDataByUserId(1, userId);
			
			request.setAttribute("commentCategory", request.getParameter("commentCategory"));
			request.setAttribute("page", 1);
			return "/view/myPage/myComment/myCommentController.jsp";
		} else {//페이지 눌렀을 때
			int p = Integer.parseInt(request.getParameter("page"));
			pgData = rvbCmtDao.getPagingDataByUserId(p, userId);
			
			if (p > pgData.getMaxPage()) {//요청 폐이지가 최대 페이지수를 넘어갈때
				request.setAttribute("commentCategory", request.getParameter("commentCategory"));
				request.setAttribute("page", pgData.getMaxPage());
				return "/view/myPage/myComment/myCommentController.jsp";
			} else if (p < 1) {//요청 페이지가 최소페이지수 즉, 1보다 작을 떄
				request.setAttribute("commentCategory", request.getParameter("commentCategory"));
				request.setAttribute("page", 1);
				return "/view/myPage/myComment/myCommentController.jsp";
			}
			
			int startIdx = pgData.getLimitBoardNum() * (pgData.getPage() - 1);
	        int endIdx = pgData.getLimitBoardNum() * pgData.getPage() - 1;
	        
	        if (endIdx >= 0) {
	        	commentList = rvbCmtDao.getCommentListByUserId(startIdx, endIdx, userId);
	        	
	        	for (ReviewBoardCmt comment : commentList) {
	        		boardList.add(rvbDao.select(Integer.toString(comment.getRvb_id())));
	        	}
	        }
		}
		
		request.setAttribute("pgData", pgData);
		request.setAttribute("commentList", commentList);
		request.setAttribute("boardList", boardList);
		request.setAttribute("commentCategory", request.getParameter("commentCategory"));
		request.setAttribute("fdURL", "myRvBoardComment.sg");
		return "/view/myPage/myComment/myComment.jsp";
	}
}
