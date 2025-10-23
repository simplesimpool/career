package api.main;

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

import model.ReviewBoard;
import model.Users;
import model.dao.ReviewBoardDao;
import model.dao.UsersDao;

@WebServlet("/LoadDataServlet")
public class LoadDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoadDataServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JSONObject resJsonObject = new JSONObject();
		
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
