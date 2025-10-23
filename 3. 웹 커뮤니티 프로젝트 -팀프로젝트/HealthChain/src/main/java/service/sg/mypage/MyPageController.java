package service.sg.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;

public class MyPageController implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		if (request.getParameter("category").equals("userUpdate")) {
			request.setAttribute("fdURL", "myPageController.sg");
			request.setAttribute("category", "userUpdate");
			return "/view/myPage/myPageController.jsp";
		} else if (request.getParameter("category").equals("myBoard")) {
			request.setAttribute("fdURL", "myPageController.sg");
			request.setAttribute("category", "myBoard");
			return "/view/myPage/myPageController.jsp";
		} else if (request.getParameter("category").equals("myComment")) {
			request.setAttribute("fdURL", "myPageController.sg");
			request.setAttribute("category", "myComment");
			return "/view/myPage/myPageController.jsp";
		} else { //리퀘스트 카테고리 오류 포워딩 전용 (아직안함)
			return null;
		}
	}
}
