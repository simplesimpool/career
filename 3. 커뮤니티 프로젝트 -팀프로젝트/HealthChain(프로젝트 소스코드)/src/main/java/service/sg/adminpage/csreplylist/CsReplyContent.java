package service.sg.adminpage.csreplylist;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.CustomerService;
import model.dao.CustomerServiceDao;

public class CsReplyContent implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		CustomerServiceDao csDao = CustomerServiceDao.getInstance();
		CustomerService cs = csDao.select(request.getParameter("id"));
		
		int lvl = cs.getCs_level();
		int parentId = cs.getCs_parent_id();
		int index = csDao.getIndex(request.getParameter("id"));
		int page = index / csDao.getPagingData(0, csDao.getTotal()).getLimitBoardNum() + 1;//제한 게시글 갯수만 필요함
		
		request.setAttribute("id", request.getParameter("id"));
		request.setAttribute("lvl", lvl);
		request.setAttribute("parentId", parentId);
		request.setAttribute("page", page);
		request.setAttribute("fdURL", "csReplyContent.sg");
		return "/view/adminPage/customerServiceReplyList/csReplyContentForward.jsp";
	}
}
