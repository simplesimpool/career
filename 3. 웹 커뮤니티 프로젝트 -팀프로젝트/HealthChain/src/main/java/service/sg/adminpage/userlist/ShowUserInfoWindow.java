package service.sg.adminpage.userlist;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.Users;
import model.dao.UsersDao;

public class ShowUserInfoWindow implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		UsersDao userDao = UsersDao.getInstance();
		Users user = userDao.select(request.getParameter("userId"));
		
		request.setAttribute("user", user);
		request.setAttribute("fdURL", "showUserInfoWindow.sg");
		return "/view/adminPage/userList/userInfoWindow.jsp";
	}
}
