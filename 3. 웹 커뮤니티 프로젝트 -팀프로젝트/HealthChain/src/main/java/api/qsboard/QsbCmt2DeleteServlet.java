package api.qsboard;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import model.QuestionBoardCmt2;
import model.dao.QuestionBoardCmt2Dao;

@WebServlet("/QsbCmt2DeleteServlet")
public class QsbCmt2DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QsbCmt2DeleteServlet() {
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
        int qsbCmt2Id = reqJsonObject.getInt("qsbCmt2Id");
        int cmt2Page = reqJsonObject.getInt("cmt2Page");
		///////////////////////////////////////////////////////////////////////////////////////////////////////////
        JSONObject resJsonObject = new JSONObject();
        
        QuestionBoardCmt2Dao qsbCmt2Dao = QuestionBoardCmt2Dao.getInstance();
        QuestionBoardCmt2 qsbCmt2 = qsbCmt2Dao.select(Integer.toString(qsbCmt2Id));
        qsbCmt2.setQsb_cmt2_del("y");
        
        int result = 0;
        result = qsbCmt2Dao.deleteTree(Integer.toString(qsbCmt2Id));
        
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
