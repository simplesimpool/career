package service.sw;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;

public class LoginForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// fdURL parameter
		// page parameter
		String fdURL = request.getParameter("fdURL");
		String page = request.getParameter("page");
		String order = request.getParameter("orderValue");
		return "/view/login/loginForm.jsp";

	}

}
