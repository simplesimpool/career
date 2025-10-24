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

import model.ReviewBoard;
import model.dao.ReviewBoardDao;

@WebServlet("/RvbLikeServlet")
public class RvbLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RvbLikeServlet() {
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
        String rvbId = Integer.toString(reqJsonObject.getInt("rvbId"));
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        JSONObject resJsonObject = new JSONObject();
        
        ReviewBoardDao rvbDao = ReviewBoardDao.getInstance();
        ReviewBoard rvb = rvbDao.select(rvbId);
        rvb.setRvb_like_cnt(rvb.getRvb_like_cnt() + 1);
        
        int result = 0;
        result = rvbDao.update(rvb);
        
        resJsonObject.put("result", result);
        resJsonObject.put("likeCnt", rvb.getRvb_like_cnt());
        
		PrintWriter out = response.getWriter();
        out.print(resJsonObject.toString());
        out.flush();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}
}
