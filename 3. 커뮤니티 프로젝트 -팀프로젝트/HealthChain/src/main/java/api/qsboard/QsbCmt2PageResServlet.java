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

import model.PagingData;
import model.QuestionBoardCmt;
import model.QuestionBoardCmt2;
import model.Users;
import model.dao.QuestionBoardCmt2Dao;
import model.dao.QuestionBoardCmtDao;
import model.dao.UsersDao;

@WebServlet("/QsbCmt2PageResServlet")
public class QsbCmt2PageResServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QsbCmt2PageResServlet() {
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
        String qsbCmtId = Integer.toString(reqJsonObject.getInt("qsbCmtId"));
        int cmt2Page = reqJsonObject.getInt("cmt2Page");
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        List<QuestionBoardCmt2> cmt2List = new ArrayList<QuestionBoardCmt2>();
        List<String> userNickNameList = new ArrayList<String>();
        QuestionBoardCmt2Dao qsbCmt2Dao = QuestionBoardCmt2Dao.getInstance();
        UsersDao userDao = UsersDao.getInstance();
        PagingData cmt2PgData = qsbCmt2Dao.getPagingData(cmt2Page, qsbId, qsbCmtId);
        
        if (cmt2Page > cmt2PgData.getMaxPage()) {
        	cmt2PgData = qsbCmt2Dao.getPagingData(cmt2PgData.getMaxPage(), qsbId, qsbCmtId);
        } else if (cmt2Page < 1) {
        	cmt2PgData = qsbCmt2Dao.getPagingData(1, qsbId, qsbCmtId);
        }
        
        int startIdx = cmt2PgData.getLimitBoardNum() * (cmt2PgData.getPage() - 1);
        int endIdx = cmt2PgData.getLimitBoardNum() * cmt2PgData.getPage() - 1;
        if(endIdx >= 0) {
        	cmt2List = qsbCmt2Dao.getCommentList(startIdx, endIdx, qsbId, qsbCmtId);
        }
        
        for(QuestionBoardCmt2 qsbCmt2 : cmt2List) {
        	Users user = userDao.select(qsbCmt2.getUser_id());
        	userNickNameList.add(user.getUser_nickname());
        }
        
        JSONObject resJsonObject = new JSONObject();
		resJsonObject.put("totalCmt2Num", cmt2PgData.getTotalBoardNum());
		resJsonObject.put("limitCmt2Num", cmt2PgData.getLimitBoardNum());
		resJsonObject.put("limitCmt2PageNum", cmt2PgData.getLimitPageNum());
		
		resJsonObject.put("cmt2Page", cmt2PgData.getPage());
		resJsonObject.put("cmt2StartPage", cmt2PgData.getStartPage());
		resJsonObject.put("cmt2EndPage", cmt2PgData.getEndPage());
		resJsonObject.put("cmt2NextPage", cmt2PgData.getNextPage());
		resJsonObject.put("cmt2PrevPage", cmt2PgData.getPrevPage());
		resJsonObject.put("cmt2MaxPage", cmt2PgData.getMaxPage());
		
		resJsonObject.put("cmt2List", cmt2List);
		resJsonObject.put("cmt2UserNickNameList", userNickNameList);
        
        PrintWriter out = response.getWriter();
        out.print(resJsonObject.toString());
        out.flush();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}
}
