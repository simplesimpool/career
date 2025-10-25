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

import model.QuestionBoardCmt2;
import model.dao.QuestionBoardCmt2Dao;

@WebServlet("/QsbCmt2ReplyServlet")
public class QsbCmt2ReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QsbCmt2ReplyServlet() {
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
        int qsbId = reqJsonObject.getInt("qsbId");
        int qsbCmtId = reqJsonObject.getInt("qsbCmtId");
        int lvl = reqJsonObject.getInt("lvl");
        int targetId = reqJsonObject.getInt("targetId");
        String qsbCmt2Reply = reqJsonObject.getString("qsbCmt2Reply");
        int cmt2Page = reqJsonObject.getInt("cmt2Page");
        HttpSession session = request.getSession(false);
		String userId = (String)session.getAttribute("userId");
		///////////////////////////////////////////////////////////////////////////////////////////////////////////
        JSONObject resJsonObject = new JSONObject();
        
        QuestionBoardCmt2Dao qsbCmt2Dao = QuestionBoardCmt2Dao.getInstance();
        QuestionBoardCmt2 qsbCmt2 = new QuestionBoardCmt2();
        qsbCmt2.setUser_id(userId);
        qsbCmt2.setQsb_id(qsbId);
        qsbCmt2.setQsb_cmt_id(qsbCmtId);
        qsbCmt2.setQsb_cmt2_level(lvl + 1);
        qsbCmt2.setQsb_cmt2_parent_id(targetId);
        qsbCmt2.setQsb_cmt2_reply(qsbCmt2Reply);
        
        int result = 0;
        result = qsbCmt2Dao.reply(qsbCmt2);
        
        int index = qsbCmt2Dao.getIndex(Integer.toString(qsbId), Integer.toString(qsbCmtId), Integer.toString(targetId));
		int limitBoardNum = qsbCmt2Dao.getPagingData(0, Integer.toString(qsbId), Integer.toString(qsbCmtId)).getLimitBoardNum();
		
		if ((index + 1) % limitBoardNum == 0) {
			cmt2Page += 1;
		}
        
        resJsonObject.put("cmt2Page", cmt2Page);
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
