package api.qsboard;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import model.FreeBoardCmt;
import model.QuestionBoardCmt;
import model.dao.FreeBoardCmtDao;
import model.dao.QuestionBoardCmtDao;

@WebServlet("/QsbCmtWriteServlet")
public class QsbCmtWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QsbCmtWriteServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=UTF-8");
		
		StringBuilder reqJson = new StringBuilder();//post데이터 읽기시작코드
        String line;
        try (BufferedReader reader = request.getReader()) {
            while ((line = reader.readLine()) != null) {
                reqJson.append(line);
            }
        }
        JSONObject reqJsonObject = new JSONObject(reqJson.toString());
        String qsbCmtReply = reqJsonObject.getString("qsbCmtReply");
        int qsbId = reqJsonObject.getInt("qsbId");
        HttpSession session = request.getSession(false);
		String userId = (String)session.getAttribute("userId");
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        JSONObject resJsonObject = new JSONObject();
        
        QuestionBoardCmtDao qsbCmtDao = QuestionBoardCmtDao.getInstance();
        QuestionBoardCmt qsbCmt = new QuestionBoardCmt();
        qsbCmt.setUser_id(userId);
        qsbCmt.setQsb_id(qsbId);
        qsbCmt.setQsb_cmt_reply(qsbCmtReply);
        
        int result = 0;
        result = qsbCmtDao.insert(qsbCmt);
        resJsonObject.put("result", result);
        
        PrintWriter out = response.getWriter();
        out.print(resJsonObject.toString());
        out.flush();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}
}
