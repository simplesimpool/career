package service.sg.mypage.mycomment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;

public class MyCommentController implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("commentCategory", request.getParameter("commentCategory"));
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("fdURL", "myCommentController.sg");
		//if the page parameter is added, it will remained and can send it to the each of services.
		//but if remove the page parameter, each selection will lead the page to 1.
		return "/view/myPage/myComment/myCommentController.jsp";
	}
}
