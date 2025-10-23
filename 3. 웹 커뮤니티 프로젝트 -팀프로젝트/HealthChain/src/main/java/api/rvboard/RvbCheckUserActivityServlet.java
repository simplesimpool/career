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

import model.Users;
import model.dao.UsersDao;

@WebServlet("/RvbCheckUserActivityServlet")
public class RvbCheckUserActivityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RvbCheckUserActivityServlet() {
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
        String userId = reqJsonObject.getString("id");
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        JSONObject resJsonObject = new JSONObject();
        
        UsersDao userDao = UsersDao.getInstance();
        Users user = userDao.select(userId);
        
        if (user == null) {
        	resJsonObject.put("result", "null");
        } else if (user.getUser_activity().equals("y")) {
        	resJsonObject.put("result", "true");
        } else {
        	resJsonObject.put("result", "false");
        }
        
        PrintWriter out = response.getWriter();
        out.print(resJsonObject.toString());
        out.flush();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}
}
