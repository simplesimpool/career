package model.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.PagingData;
import model.Users;

public class UsersDao {
	private static UsersDao instance = new UsersDao();
	private final int limitBoardNum = 15;
	private final int limitPageNum = 10;

	private UsersDao() {

	}

	public static UsersDao getInstance() {
		return instance;
	}

	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println("UsersDao session error");
			System.out.println(e.getMessage());
		}
	}
	
	public int getTotal() {
		return session.selectOne("usersns.getTotal");
	}
	
	public int getNormalUserTotal() {
		return session.selectOne("usersns.getNormalUserTotal");
	}
	
	public int getDoctorUserTotal() {
		return session.selectOne("usersns.getDoctorUserTotal");
	}
	
	public int getResignedUserTotal() {
		return session.selectOne("usersns.getResignedUserTotal");
	}
	
	public Users select(String id) {
		return session.selectOne("usersns.select", id);
	}

	public Users selectByDrCode(String code) {
		return session.selectOne("usersns.selectByDrCode", code);
	}
	
	public Users selectByNickName(String nickName) {
		return session.selectOne("usersns.selectByNickName", nickName);
	}
	
	public Users selectByEmail(String email) {
		return session.selectOne("usersns.selectByEmail", email);
	}
	
	public Users selectByTel(String tel) {
		return session.selectOne("usersns.selectByTel", tel);
	}
	
	public int update(Users user) {
		return session.update("usersns.update", user);
	}

	public int insert(Users user) {
		return session.insert("usersns.insert", user);
	}
	
	public PagingData getPagingData(int page, int total) {
		PagingData pgData = new PagingData();
		int totalBoardNum = total;

		pgData.setTotalBoardNum(totalBoardNum);
		pgData.setLimitBoardNum(limitBoardNum);
		pgData.setLimitPageNum(limitPageNum);

		if (totalBoardNum <= 0) {
			pgData.setMaxPage(1);
		} else if (totalBoardNum % limitBoardNum == 0) {
			pgData.setMaxPage(totalBoardNum / limitBoardNum);
		} else {
			pgData.setMaxPage(totalBoardNum / limitBoardNum + 1);
		}

		if (page < 1) {
			pgData.setPage(1);
		} else if (page > pgData.getMaxPage()) {
			pgData.setPage(pgData.getMaxPage());
		}
		pgData.setPage(page);

		pgData.setStartPage(limitPageNum * ((page - 1) / limitPageNum) + 1);
		pgData.setEndPage(pgData.getStartPage() + limitPageNum - 1);
		if (pgData.getMaxPage() <= pgData.getEndPage()) {
			pgData.setEndPage(pgData.getMaxPage());
		}

		pgData.setNextPage(pgData.getEndPage() + 1);
		pgData.setPrevPage(pgData.getStartPage() - 1);

		return pgData;
	}
	
	public List<Users> getBoardList(int startIdx, int endIdx) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIdx", startIdx + 1);
		map.put("endIdx", endIdx + 1);
		return session.selectList("usersns.getBoardList", map);
	}
	
	public List<Users> getBoardListByNormalUser(int startIdx, int endIdx) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIdx", startIdx + 1);
		map.put("endIdx", endIdx + 1);
		return session.selectList("usersns.getBoardListByNormalUser", map);
	}
	
	public List<Users> getBoardListByDoctorUser(int startIdx, int endIdx) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIdx", startIdx + 1);
		map.put("endIdx", endIdx + 1);
		return session.selectList("usersns.getBoardListByDoctorUser", map);
	}
	
	public List<Users> getBoardListByResignedUser(int startIdx, int endIdx) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIdx", startIdx + 1);
		map.put("endIdx", endIdx + 1);
		return session.selectList("usersns.getBoardListByResignedUser", map);
	}
}
