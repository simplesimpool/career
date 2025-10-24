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

import model.Users;
import model.dao.UsersDao;

@WebServlet("/QsbCheckDoctorServlet")
public class QsbCheckDoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QsbCheckDoctorServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=UTF-8");
		
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
		JSONObject resJsonObject = new JSONObject();
		HttpSession session = request.getSession(false); // 세션이 없으면 null 반환
		UsersDao userDao = UsersDao.getInstance();
		
		int result = 0;
		String userId = (String)session.getAttribute("userId");
		if (userId != null) {
			Users user = userDao.select(userId);
			
		    if(user.getDr_lic_code() != null) {
		    	result = 1;//의사임
		    } else {
		    	result = -1;//의사가 아님
		    }
		} else {
		    result = -2;//비회원임
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
