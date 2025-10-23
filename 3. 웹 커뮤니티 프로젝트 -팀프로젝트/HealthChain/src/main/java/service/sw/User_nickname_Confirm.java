package service.sw;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.coyote.Request;

import command.service.CommandProcess;
import model.Users;
import model.dao.UsersDao;

public class User_nickname_Confirm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String userNickname = request.getParameter("userNickname");
		UsersDao ud = UsersDao.getInstance();
		Users users = ud.selectByNickName(userNickname);
		String msg = "";
		
	
		
		if (users == null)
			msg = "사용가능한 닉네임입니다";
		else 
			msg = "중복되니 다른 닉네임을 사용하세요";
		
		request.setAttribute("msg", msg);
		return "view/join/user_nickname_confirm.jsp";
	}

}
