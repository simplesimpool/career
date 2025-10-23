package service.sg.frboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;

public class FrBoardWriteForm implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("fdURL", "frBoardWriteForm.sg");
		return "/view/freeBoard/frBoardWriteForm.jsp";
	}
}
