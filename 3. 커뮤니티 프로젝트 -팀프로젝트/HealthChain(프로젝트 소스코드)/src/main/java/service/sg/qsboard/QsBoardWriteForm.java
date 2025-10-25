package service.sg.qsboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.service.CommandProcess;

public class QsBoardWriteForm implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("fdURL", "qsBoardWriteForm.sg");
		return "/view/questionBoard/qsBoardWriteForm.jsp";
	}
}
