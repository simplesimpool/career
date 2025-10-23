package api.qsboard;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import model.FreeBoardCmt;
import model.PagingData;
import model.QuestionBoardCmt;
import model.Users;
import model.dao.FreeBoardCmtDao;
import model.dao.QuestionBoardCmtDao;
import model.dao.UsersDao;

@WebServlet("/QsbCmtPageResServlet")
public class QsbCmtPageResServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QsbCmtPageResServlet() {
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
        String qsbId = Integer.toString(reqJsonObject.getInt("qsbId"));
        int cmtPage = reqJsonObject.getInt("cmtPage");
        ///////////////////////////////////////////////////////////////////여기까지 post.data 가져오는 파트
        List<QuestionBoardCmt> cmtList = new ArrayList<QuestionBoardCmt>();
        List<String> userNickNameList = new ArrayList<String>();
        QuestionBoardCmtDao qsbCmtDao = QuestionBoardCmtDao.getInstance();
        UsersDao userDao = UsersDao.getInstance();
        PagingData cmtPgData = qsbCmtDao.getPagingData(cmtPage, qsbId);
        
        if (cmtPage > cmtPgData.getMaxPage()) {
        	cmtPgData = qsbCmtDao.getPagingData(cmtPgData.getMaxPage(), qsbId);
        } else if (cmtPage < 1) {
        	cmtPgData = qsbCmtDao.getPagingData(1, qsbId);
        }
        
        int startIdx = cmtPgData.getLimitBoardNum() * (cmtPgData.getPage() - 1);
        int endIdx = cmtPgData.getLimitBoardNum() * cmtPgData.getPage() - 1;
        if(endIdx >= 0) {
        	cmtList = qsbCmtDao.getCommentList(startIdx, endIdx, qsbId);
        }
        
        for(QuestionBoardCmt qsbCmt : cmtList) {
        	Users user = userDao.select(qsbCmt.getUser_id());
        	userNickNameList.add(user.getUser_nickname());
        }
        
        JSONObject resJsonObject = new JSONObject();
		resJsonObject.put("totalCmtNum", cmtPgData.getTotalBoardNum());
		resJsonObject.put("limitCmtNum", cmtPgData.getLimitBoardNum());
		resJsonObject.put("limitCmtPageNum", cmtPgData.getLimitPageNum());
		
		resJsonObject.put("cmtPage", cmtPgData.getPage());
		resJsonObject.put("cmtStartPage", cmtPgData.getStartPage());
		resJsonObject.put("cmtEndPage", cmtPgData.getEndPage());
		resJsonObject.put("cmtNextPage", cmtPgData.getNextPage());
		resJsonObject.put("cmtPrevPage", cmtPgData.getPrevPage());
		resJsonObject.put("cmtMaxPage", cmtPgData.getMaxPage());
		
		resJsonObject.put("cmtList", cmtList);
		resJsonObject.put("cmtUserNickNameList", userNickNameList);
		
		resJsonObject.put("adminId", "admin");
        
        PrintWriter out = response.getWriter();
        out.print(resJsonObject.toString());
        out.flush();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}
}
