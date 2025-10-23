package service.sg.adminpage.userlist;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.PagingData;
import model.Users;
import model.dao.UsersDao;

public class AllUserList implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		UsersDao userDao = UsersDao.getInstance();
		PagingData pgData = null;
		List<Users> userList = new ArrayList<Users>();
		
		if (request.getParameter("page") == null || request.getParameter("page").equals("")) {
			pgData = userDao.getPagingData(1, userDao.getTotal());
			
			request.setAttribute("userCategory", request.getParameter("userCategory"));
			request.setAttribute("page", 1);
			return "/view/adminPage/userList/userListController.jsp";
		} else {//페이지 눌렀을 때
			int p = Integer.parseInt(request.getParameter("page"));
			pgData = userDao.getPagingData(p, userDao.getTotal());
			
			if (p > pgData.getMaxPage()) {//요청 폐이지가 최대 페이지수를 넘어갈때
				request.setAttribute("userCategory", request.getParameter("userCategory"));
				request.setAttribute("page", pgData.getMaxPage());
				return "/view/adminPage/userList/userListController.jsp";
			} else if (p < 1) {//요청 페이지가 최소페이지수 즉, 1보다 작을 떄
				request.setAttribute("userCategory", request.getParameter("userCategory"));
				request.setAttribute("page", 1);
				return "/view/adminPage/userList/userListController.jsp";
			}
			
			int startIdx = pgData.getLimitBoardNum() * (pgData.getPage() - 1);
	        int endIdx = pgData.getLimitBoardNum() * pgData.getPage() - 1;
	        
	        if (endIdx >= 0) {
	        	userList = userDao.getBoardList(startIdx, endIdx);
	        }
		}
		
		request.setAttribute("pgData", pgData);
		request.setAttribute("userList", userList);
		request.setAttribute("userCategory", request.getParameter("userCategory"));
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("fdURL", "allUserList.sg");
		return "/view/adminPage/userList/userList.jsp";
	}
}
