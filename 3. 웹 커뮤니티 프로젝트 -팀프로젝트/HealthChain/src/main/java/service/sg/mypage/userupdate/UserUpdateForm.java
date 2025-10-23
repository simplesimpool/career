package service.sg.mypage.userupdate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.service.CommandProcess;
import model.Users;
import model.dao.UsersDao;

public class UserUpdateForm implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		String userId = (String)session.getAttribute("userId");
		
		UsersDao userDao = UsersDao.getInstance();
		Users user = userDao.select(userId);
		
		request.setAttribute("user", user);
		request.setAttribute("fdURL", "userUpdateForm.sg");
		return "/view/myPage/userUpdate/userUpdateForm.jsp";
	}
}
