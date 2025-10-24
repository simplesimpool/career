package api.frboard;

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
import model.dao.FreeBoardCmtDao;

@WebServlet("/FrbCmtWriteServlet")
public class FrbCmtWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FrbCmtWriteServlet() {
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
        String frbCmtReply = reqJsonObject.getString("frbCmtReply");
        int frbId = reqJsonObject.getInt("frbId");
        HttpSession session = request.getSession(false);
		String userId = (String)session.getAttribute("userId");
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        JSONObject resJsonObject = new JSONObject();
        
        FreeBoardCmtDao frbCmtDao = FreeBoardCmtDao.getInstance();
        FreeBoardCmt frbCmt = new FreeBoardCmt();
        frbCmt.setUser_id(userId);
        frbCmt.setFrb_id(frbId);
        frbCmt.setFrb_cmt_reply(frbCmtReply);
        
        int result = 0;
        result = frbCmtDao.insert(frbCmt);
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
