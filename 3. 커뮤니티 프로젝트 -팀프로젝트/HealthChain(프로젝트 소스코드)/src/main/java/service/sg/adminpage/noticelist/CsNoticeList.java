package service.sg.adminpage.noticelist;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.CustomerService;
import model.PagingData;
import model.dao.CustomerServiceDao;

public class CsNoticeList implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		CustomerServiceDao csDao = CustomerServiceDao.getInstance();
		PagingData pgData = null;
		List<CustomerService> boardList = new ArrayList<CustomerService>();
		
		if(request.getParameter("page") == null || request.getParameter("page").equals("")) {
			pgData = csDao.getPagingData(1, csDao.getTotalByNotice());
			
			request.setAttribute("boardCategory", request.getParameter("boardCategory"));
			request.setAttribute("page", 1);
			return "/view/adminPage/noticeList/noticeListController.jsp";
		} else {//페이지 눌렀을 때
			int p = Integer.parseInt(request.getParameter("page"));
			pgData = csDao.getPagingData(p, csDao.getTotalByNotice());
			
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
	        	boardList = csDao.getBoardListByNotice(startIdx, endIdx);
	        }
		}
		
		request.setAttribute("pgData", pgData);
		request.setAttribute("boardList", boardList);
		request.setAttribute("boardCategory", request.getParameter("boardCategory"));
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("fdURL", "csNoticeList.sg");
		return "/view/adminPage/noticeList/noticeList.jsp";
	}
}
