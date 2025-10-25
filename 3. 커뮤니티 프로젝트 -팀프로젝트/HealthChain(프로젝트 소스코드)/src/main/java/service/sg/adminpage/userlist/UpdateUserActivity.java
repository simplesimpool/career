package service.sg.adminpage.userlist;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.Users;
import model.dao.UsersDao;

public class UpdateUserActivity implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		UsersDao userDao = UsersDao.getInstance();
		Users user = userDao.select(request.getParameter("userId"));
		
		if(request.getParameter("userActivity").equals("n")) {
			user.setUser_activity("y");
		} else {
			user.setUser_activity("n");
		}
		
		int result = 0;
		result = userDao.update(user);
		
		request.setAttribute("result", result);
		request.setAttribute("userCategory", request.getParameter("userCategory"));
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("fdURL", "updateUserActivity.sg");
		return "/view/adminPage/userList/updateUserActivityResult.jsp";
	}
}
