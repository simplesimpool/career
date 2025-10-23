package service.sg.csboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;

public class CsBoardWriteForm implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("fdURL", "csBoardWriteForm.sg");
		return "/view/customerService/csBoardWriteForm.jsp";
	}
}
