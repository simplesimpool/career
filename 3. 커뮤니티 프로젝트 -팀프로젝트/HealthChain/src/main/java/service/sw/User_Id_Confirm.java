package service.sw;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;
import model.Users;
import model.dao.UsersDao;

public class User_Id_Confirm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		UsersDao ud = UsersDao.getInstance();
		Users users = ud.select(userId);

		String msg = "";
		
		if(users == null) {
		   msg = "사용가능한 아이디입니다";
		}
		else {
		  msg = "중복입니다, 다른 아이디를 사용하십시오";
		}
		
		request.setAttribute("msg", msg);
		
		return "/view/join/user_id_confirm.jsp";
	}

}
