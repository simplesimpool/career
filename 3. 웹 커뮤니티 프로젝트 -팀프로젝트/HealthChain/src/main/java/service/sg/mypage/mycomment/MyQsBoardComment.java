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
import model.SearchComment;
import model.dao.FreeBoardDao;
import model.dao.QuestionBoardDao;
import model.dao.ReviewBoardDao;
import model.dao.SearchCommentDao;

public class MyQsBoardComment implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		String userId = (String)session.getAttribute("userId");
		
		SearchCommentDao srCmtDao = SearchCommentDao.getInstance();
		QuestionBoardDao qsbDao = QuestionBoardDao.getInstance();
		PagingData pgData = null;
		
		List<SearchComment> commentList = new ArrayList<SearchComment>();
		List<QuestionBoard> boardList = new ArrayList<QuestionBoard>();
		
		if (request.getParameter("page") == null || request.getParameter("page").equals("")) {
			pgData = srCmtDao.getPagingDataByQsbCmtAndUserId(1, userId);
			
			request.setAttribute("commentCategory", request.getParameter("commentCategory"));
			request.setAttribute("page", 1);
			return "/view/myPage/myComment/myCommentController.jsp";
		} else {//페이지 눌렀을 때
			int p = Integer.parseInt(request.getParameter("page"));
			pgData = srCmtDao.getPagingDataByQsbCmtAndUserId(p, userId);
			
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
	        	commentList = srCmtDao.getQsbCommentListByUserId(startIdx, endIdx, userId);
	        	
	        	for (SearchComment comment : commentList) {
	        		QuestionBoard qsb = qsbDao.select(comment.getBoard_id());
	        		boardList.add(qsb);
	        	}
	        }
		}
		
		request.setAttribute("pgData", pgData);
		request.setAttribute("commentList", commentList);
		request.setAttribute("boardList", boardList);
		request.setAttribute("commentCategory", request.getParameter("commentCategory"));
		request.setAttribute("fdURL", "myQsBoardComment.sg");
		return "/view/myPage/myComment/myComment.jsp";
	}
}