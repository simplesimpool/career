package api.main;

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

import org.apache.catalina.User;
import org.json.JSONObject;

import model.ReviewBoard;
import model.Users;
import model.dao.ReviewBoardDao;
import model.dao.UsersDao;

@WebServlet("/GetRvbByLikeServlet")
public class GetRvbByLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GetRvbByLikeServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=UTF-8");

		StringBuilder reqJson = new StringBuilder();// post데이터 읽기시작코드
		String line;
		try (BufferedReader reader = request.getReader()) {
			while ((line = reader.readLine()) != null) {
				reqJson.append(line);
			}
		}
		JSONObject reqJsonObject = new JSONObject(reqJson.toString());
		int reqCnt = reqJsonObject.getInt("reqCnt");
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////
		JSONObject resJsonObject = new JSONObject();
		
		ReviewBoardDao rvbDao = ReviewBoardDao.getInstance();
		UsersDao userDao = UsersDao.getInstance();
		
		List<ReviewBoard> rvbList = new ArrayList<ReviewBoard>();
		List<Integer> pageList = new ArrayList<Integer>();
		List<String> userNickNameList = new ArrayList<String>();
		
		Boolean isReadable = false;
		if(reqCnt > 0) {
			isReadable = true;
		}
		
		int noticeCnt = rvbDao.getNoticeTotal();
		int userBoardCnt = rvbDao.getTotal() - noticeCnt;
		if (userBoardCnt > 0) {
			rvbList = rvbDao.getBoardListByLike(noticeCnt, noticeCnt + reqCnt - 1);
		}
		
		for (ReviewBoard rvb : rvbList) {
			int index = rvbDao.getIndexByLike(Integer.toString(rvb.getRvb_id()));
			int page = index / rvbDao.getPagingData(0, rvbDao.getTotal()).getLimitBoardNum() + 1;//제한 게시글 갯수만 필요함
			pageList.add(page);
			Users user =  userDao.select(rvb.getUser_id());
			userNickNameList.add(user.getUser_nickname());
		}
		
		resJsonObject.put("rvbList", rvbList);
		resJsonObject.put("pageList", pageList);
		resJsonObject.put("userNickNameList", userNickNameList);
		resJsonObject.put("order", "like");
		resJsonObject.put("isReadable", isReadable);
		
		PrintWriter out = response.getWriter();
		out.print(resJsonObject.toString());
		out.flush();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}
}
