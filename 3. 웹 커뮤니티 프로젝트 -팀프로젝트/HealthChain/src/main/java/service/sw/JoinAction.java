package service.sw;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.service.CommandProcess;
import model.Users;
import model.dao.UsersDao;

public class JoinAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
	   String userId = request.getParameter("userId");
	   String drLicCode = request.getParameter("drLicCode");
	   String userPw = request.getParameter("userPw");
	   String userName = request.getParameter("userName");
	   String userAddr = request.getParameter("userAddr");
	   String userTel= request.getParameter("userTel");
	   String userNickname = request.getParameter("userNickname");
	   

	   
	   Users users = new Users();
	   users.setUser_id(userId);
	   users.setDr_lic_code(drLicCode);
	   users.setUser_pw(userPw);
	   users.setUser_name(userName);
	   users.setUser_addr(userAddr);
	   users.setUser_tel(userTel);
	   users.setUser_nickname(userNickname);
	   int result = 0;
	   
	   
	   UsersDao ud = UsersDao.getInstance();
	   Users users2 = ud.select(userId);
	   Users users3 = ud.selectByDrCode(drLicCode);
	   Users users4 = ud.selectByNickName(userNickname);
		
		  if (users2 == null && users3 == null && users4 == null )
			  result = ud.insert(users); // 자동으로 1들어감
		  else result = -1;
		
	     request.setAttribute("result", result);
		
		return "/view/join/join.jsp";
	}

}
