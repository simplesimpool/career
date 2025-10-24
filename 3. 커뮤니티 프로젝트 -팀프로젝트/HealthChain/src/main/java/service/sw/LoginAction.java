package service.sw;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.service.CommandProcess;
import model.dao.UsersDao;
import model.Users;

public class LoginAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String fdURL = request.getParameter("fdURL");
		String page = request.getParameter("page");
		String order = request.getParameter("order");

		UsersDao ud = UsersDao.getInstance();
		int result = 0; // 로그인 성공 체크
		int fdResult = 0; // 이전페이지 체크
		Users users = ud.select(userId);

		if (users != null && users.getUser_pw().equals(userPw) && users.getUser_del().equals("n")
				&& !users.getUser_id().equals("admin")) {

			HttpSession session = request.getSession(); // 세션 연결
			session.setAttribute("userId", userId);
			result = 1; // 로그인 성공

			if (order == null || order.length() == 0) { // 정렬이 있는지 판정..

				if (fdURL.length() > 0) { // fdURL이 존재하는지확인
					fdResult = 1;
				} else
					fdResult = 0;

			} else if (order.length() >= 1) {
				fdResult = 2;
			}

		} else {

			result = -1; // 로그인 실패
		}
		request.setAttribute("result", result);
		request.setAttribute("fdResult", fdResult);
		return "/view/login/login.jsp";
	}

}
