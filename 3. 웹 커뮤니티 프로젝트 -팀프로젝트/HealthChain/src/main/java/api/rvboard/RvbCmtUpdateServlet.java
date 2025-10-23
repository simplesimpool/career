package api.rvboard;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import model.FreeBoardCmt;
import model.ReviewBoard;
import model.ReviewBoardCmt;
import model.dao.FreeBoardCmtDao;
import model.dao.ReviewBoardCmtDao;


@WebServlet("/RvbCmtUpdateServlet")
public class RvbCmtUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RvbCmtUpdateServlet() {
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
        int rvbCmtId = reqJsonObject.getInt("rvbCmtId");
        String rvbCmtReply = reqJsonObject.getString("rvbCmtReply");
        int cmtPage = reqJsonObject.getInt("cmtPage");
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        JSONObject resJsonObject = new JSONObject();
        
        ReviewBoardCmtDao rvbCmtDao = ReviewBoardCmtDao.getInstance();
        ReviewBoardCmt rvbCmt = rvbCmtDao.select(Integer.toString(rvbCmtId));
        rvbCmt.setRvb_cmt_reply(rvbCmtReply);
        
        
        int result = 0;
        result = rvbCmtDao.update(rvbCmt);
        
        resJsonObject.put("result", result);
        resJsonObject.put("cmtPage", cmtPage);
        PrintWriter out = response.getWriter();
        out.print(resJsonObject.toString());
        out.flush();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}
}
