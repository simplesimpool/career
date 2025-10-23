package service.sg.mypage.mycomment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.FreeBoardCmt;
import model.dao.FreeBoardCmtDao;
import model.dao.FreeBoardDao;
import model.dao.QuestionBoardCmt2Dao;
import model.dao.QuestionBoardCmtDao;
import model.dao.QuestionBoardDao;
import model.dao.ReviewBoardCmtDao;
import model.dao.ReviewBoardDao;

public class MyCommentContent implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String category = request.getParameter("category");
		String id = request.getParameter("id");
		
		FreeBoardDao frbDao = FreeBoardDao.getInstance();
		FreeBoardCmtDao frbCmtDao = FreeBoardCmtDao.getInstance();
		
		ReviewBoardDao rvbDao = ReviewBoardDao.getInstance();
		ReviewBoardCmtDao rvbCmtDao = ReviewBoardCmtDao.getInstance();
		
		QuestionBoardDao qsbDao = QuestionBoardDao.getInstance();
		QuestionBoardCmtDao qsbCmtDao = QuestionBoardCmtDao.getInstance();
		QuestionBoardCmt2Dao qsbCmt2Dao = QuestionBoardCmt2Dao.getInstance();
		
		if (category.equals("frb_cmt") && category != null && !category.equals("")) {
			String frbId = Integer.toString(frbCmtDao.select(id).getFrb_id());
			
			int index = frbDao.getIndex(frbId);
			int page = index / frbDao.getPagingData(0, frbDao.getTotal()).getLimitBoardNum() + 1;
			
			int cmtIndex = frbCmtDao.getIndex(frbId, id);
			int cmtPage = cmtIndex / frbCmtDao.getPagingData(0, frbId).getLimitBoardNum() + 1;
			
			request.setAttribute("frbId", frbId);
			request.setAttribute("page", page);
			request.setAttribute("cmtPage", cmtPage);
		} else if (category.equals("rvb_cmt") && category != null && !category.equals("")) {
			String rvbId = Integer.toString(rvbCmtDao.select(id).getRvb_id());
			
			int index = rvbDao.getIndexByDate(rvbId);
			int page = index / rvbDao.getPagingData(0, rvbDao.getTotal()).getLimitBoardNum() + 1;
			
			int cmtIndex = rvbCmtDao.getIndex(rvbId, id);
			int cmtPage = cmtIndex / rvbCmtDao.getPagingData(0, rvbId).getLimitBoardNum() + 1;
			
			request.setAttribute("rvbId", rvbId);
			request.setAttribute("page", page);
			request.setAttribute("cmtPage", cmtPage);
		}  else if (category.equals("qsb_cmt")) {
			String qsbId = Integer.toString(qsbCmtDao.select(id).getQsb_id());
			
			int index = qsbDao.getIndex(qsbId);
			int page = index / qsbDao.getPagingData(0, qsbDao.getTotal()).getLimitBoardNum() + 1;
			
			int cmtIndex = qsbCmtDao.getIndex(qsbId, id);
			int cmtPage = cmtIndex / qsbCmtDao.getPagingData(0, qsbId).getLimitBoardNum() + 1;
			
			request.setAttribute("qsbId", qsbId);
			request.setAttribute("page", page);
			request.setAttribute("cmtPage", cmtPage);
		}  else if (category.equals("qsb_cmt2")) {
			String qsbId = Integer.toString(qsbCmt2Dao.select(id).getQsb_id());
			String qsbCmtId = Integer.toString(qsbCmt2Dao.select(id).getQsb_cmt_id());
			
			int index = qsbDao.getIndex(qsbId);
			int page = index / qsbDao.getPagingData(0, qsbDao.getTotal()).getLimitBoardNum() + 1;
			
			int cmtIndex = qsbCmtDao.getIndex(qsbId, qsbCmtId);
			int cmtPage = cmtIndex / qsbCmtDao.getPagingData(0, qsbId).getLimitBoardNum() + 1;
			
			int cmt2Index = qsbCmt2Dao.getIndex(qsbId, qsbCmtId, id);
			int cmt2Page = cmt2Index / qsbCmt2Dao.getPagingData(0, qsbId, qsbCmtId).getLimitBoardNum() + 1;
			
			request.setAttribute("qsbId", qsbId);
			request.setAttribute("qsbCmtId", qsbCmtId);
			request.setAttribute("page", page);
			request.setAttribute("cmtPage", cmtPage);
			request.setAttribute("cmt2Page", cmt2Page);
		}
		
		request.setAttribute("id", id);
		request.setAttribute("category", category);
		return "/view/myPage/myComment/myCommentContentForward.jsp";
	}
}
