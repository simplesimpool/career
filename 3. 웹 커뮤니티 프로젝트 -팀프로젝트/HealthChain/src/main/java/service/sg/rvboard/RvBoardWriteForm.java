package service.sg.rvboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;

public class RvBoardWriteForm implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("order", request.getParameter("order"));
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("fdURL", "rvBoardWriteForm.sg");
		return "/view/reviewBoard/rvBoardWriteForm.jsp";
	}
}
