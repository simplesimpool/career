package service.sg.mypage.userupdate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.service.CommandProcess;
import model.Users;
import model.dao.UsersDao;

public class UserUpdate implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		
		try {
			UsersDao userDao = UsersDao.getInstance();
			HttpSession session = request.getSession(false);
			String userId = (String)session.getAttribute("userId");
			
			Users curUser = userDao.select(userId);
			
			if (!curUser.getUser_nickname().equals(request.getParameter("nickName")) &&
				request.getParameter("nickName") != null &&
				!request.getParameter("nickName").equals("") &&
				userDao.selectByNickName(request.getParameter("nickName")) != null) {
				result = -1; //중복된 닉네임
			} else if (!curUser.getUser_email().equals(request.getParameter("email")) &&
					   request.getParameter("email") != null &&
					   !request.getParameter("email").equals("") &&
					   userDao.selectByEmail(request.getParameter("email")) != null) {
				result = -2; //중복된 이메일
			} else if (!curUser.getUser_tel().equals(request.getParameter("tel")) &&
					   request.getParameter("tel") != null &&
					   !request.getParameter("tel").equals("") &&
					   userDao.selectByTel(request.getParameter("tel")) != null) {
				result = -3; //중복된 전화번호
			}
			
			if(result == 0) {
				Users user = userDao.select(userId);
				user.setUser_nickname(request.getParameter("nickName"));
				user.setUser_pw(request.getParameter("passWord"));
				user.setUser_email(request.getParameter("email"));
				user.setUser_tel(request.getParameter("tel"));
				user.setUser_addr(request.getParameter("address"));
				
				result = userDao.update(user);
			}
		} catch (Exception e) { 
			result = 0;
			e.getMessage();
			System.out.println("UserUpdate.java error"); 
		}

		request.setAttribute("result", result);
		//return null;
		return "/view/myPage/userUpdate/userUpdateResult.jsp";
	}
}
