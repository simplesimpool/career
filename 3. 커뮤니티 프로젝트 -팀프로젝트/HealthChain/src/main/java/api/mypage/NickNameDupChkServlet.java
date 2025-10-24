package api.mypage;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import model.Users;
import model.dao.UsersDao;

@WebServlet("/NickNameDupChkServlet")
public class NickNameDupChkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NickNameDupChkServlet() {
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
		} catch (Exception e) {
			System.out.println("NickNameDupChkServlet read post data error");
			e.getMessage();
		}
		JSONObject reqJsonObject = new JSONObject(reqJson.toString());
		String nickName = reqJsonObject.getString("nickName");
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////
		JSONObject resJsonObject = new JSONObject();
		int result = 1;
		
		try {
			UsersDao userDao = UsersDao.getInstance();
			Users user = null;
			
			user = userDao.selectByNickName(nickName);
			
			if(user != null) {
				result = -1;
			}
		} catch (Exception e) {
			result = 0;
			System.out.println("NickNameDupChkServlet error");
			e.getMessage();
		} 
		
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
