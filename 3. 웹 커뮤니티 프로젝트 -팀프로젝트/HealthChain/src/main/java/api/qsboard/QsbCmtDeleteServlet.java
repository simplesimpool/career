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
import model.dao.QuestionBoardCmt2Dao;
import model.dao.QuestionBoardCmtDao;

@WebServlet("/QsbCmtDeleteServlet")
public class QsbCmtDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QsbCmtDeleteServlet() {
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
        int qsbCmtId = reqJsonObject.getInt("qsbCmtId");
        int cmtPage = reqJsonObject.getInt("cmtPage");
		///////////////////////////////////////////////////////////////////////////////////////////////////////////
        JSONObject resJsonObject = new JSONObject();
        
        QuestionBoardCmtDao qsbCmtDao = QuestionBoardCmtDao.getInstance();
        QuestionBoardCmt qsbCmt = qsbCmtDao.select(Integer.toString(qsbCmtId));
        QuestionBoardCmt2Dao qsbCmt2Dao = QuestionBoardCmt2Dao.getInstance();
        
        qsbCmt.setQsb_cmt_del("y");
        qsbCmt2Dao.deleteTreeByQsbCmtId(Integer.toString(qsbCmtId));
        
        int result = 0;
        result = qsbCmtDao.update(qsbCmt);
        
        resJsonObject.put("cmtPage", cmtPage);
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
