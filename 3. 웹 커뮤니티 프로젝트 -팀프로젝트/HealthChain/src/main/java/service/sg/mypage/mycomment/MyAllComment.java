package service.sg.mypage.mycomment;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.service.CommandProcess;
import model.FreeBoard;
import model.PagingData;
import model.QuestionBoard;
import model.ReviewBoard;
import model.SearchBoard;
import model.SearchComment;
import model.dao.FreeBoardDao;
import model.dao.QuestionBoardDao;
import model.dao.ReviewBoardDao;
import model.dao.SearchBoardDao;
import model.dao.SearchCommentDao;

public class MyAllComment implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		String userId = (String)session.getAttribute("userId");
		
		FreeBoardDao frbDao = FreeBoardDao.getInstance();
		ReviewBoardDao rvbDao = ReviewBoardDao.getInstance();
		QuestionBoardDao qsbDao = QuestionBoardDao.getInstance();
		
		SearchCommentDao srCmtDao = SearchCommentDao.getInstance();
		PagingData pgData = null;
		
		List<SearchComment> commentList = new ArrayList<SearchComment>();
		List<Object> boardList = new ArrayList<Object>();
		
		if (request.getParameter("page") == null || request.getParameter("page").equals("")) {
			pgData = srCmtDao.getPagingDataByUserId(1, userId);
			
			request.setAttribute("commentCategory", request.getParameter("commentCategory"));
			request.setAttribute("page", 1);
			return "/view/myPage/myComment/myCommentController.jsp";
		} else {//페이지 눌렀을 때
			int p = Integer.parseInt(request.getParameter("page"));
			pgData = srCmtDao.getPagingDataByUserId(p, userId);
			
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
	        	commentList = srCmtDao.getCommentListByUserId(startIdx, endIdx, userId);
	        	
	        	for (SearchComment comment : commentList) {
	        		if (comment.getCmt_category().equals("frb_cmt")) {
	        			FreeBoard frb = frbDao.select(comment.getBoard_id());
	        			boardList.add(frb);
	        		} else if (comment.getCmt_category().equals("rvb_cmt")) {
	        			ReviewBoard rvb = rvbDao.select(comment.getBoard_id());
	        			boardList.add(rvb);
	        		} else if (comment.getCmt_category().equals("qsb_cmt")) {
	        			QuestionBoard qsb = qsbDao.select(comment.getBoard_id());
	        			boardList.add(qsb);
	        		} else if (comment.getCmt_category().equals("qsb_cmt2")) {
	        			QuestionBoard qsb = qsbDao.select(comment.getBoard_id());
	        			boardList.add(qsb);
	        		}
	        	}
	        }
		}
		
		request.setAttribute("pgData", pgData);
		request.setAttribute("commentList", commentList);
		request.setAttribute("boardList", boardList);
		request.setAttribute("commentCategory", request.getParameter("commentCategory"));
		request.setAttribute("fdURL", "myAllComment.sg");
		return "/view/myPage/myComment/myComment.jsp";
	}
}
