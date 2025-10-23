package model.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.MediInfoBoard;
import model.PagingData;
import model.QuestionBoard;

public class QuestionBoardDao {
	private static QuestionBoardDao instance = new QuestionBoardDao();
	private final int limitBoardNum = 15;
	private final int limitPageNum = 10;

	private QuestionBoardDao() {

	}

	public static QuestionBoardDao getInstance() {
		return instance;
	}

	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println("QuestionBoardDao session error");
			System.out.println(e.getMessage());
		}
	}

	public QuestionBoard select(String id) {
		return session.selectOne("questionboardns.select", id);
	}

	public int insert(QuestionBoard qsb) {
		return session.insert("questionboardns.insert", qsb);
	}
	
	public int update(QuestionBoard qsb) {
		return session.update("questionboardns.update", qsb);
	}

	public int getTotal() {
		return session.selectOne("questionboardns.getTotal");
	}
	
	public int getTotalByUserId(String id) {
		return session.selectOne("questionboardns.getTotalByUserId", id);
	}
	
	public int getNoticeTotal() {
		return session.selectOne("questionboardns.getNoticeTotal");
	}
	
	public int getIndex(String id) {
		return session.selectOne("questionboardns.getIndex", id);
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
	
	public PagingData getPagingDataByUserId(int page, String id) {
		PagingData pgData = new PagingData();
		int totalBoardNum = getTotalByUserId(id);

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
	
	public List<QuestionBoard> getBoardListByNotice(int startIdx, int endIdx) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIdx", startIdx + 1);
		map.put("endIdx", endIdx + 1);
		return session.selectList("questionboardns.getBoardListByNotice", map);
	}
	
	public List<QuestionBoard> getBoardListByUserId(int startIdx, int endIdx, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIdx", startIdx + 1);
		map.put("endIdx", endIdx + 1);
		map.put("id", id);
		return session.selectList("questionboardns.getBoardListByUserId", map);
	}
	
	public List<QuestionBoard> getBoardList(int startIdx, int endIdx) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIdx", startIdx + 1);
		map.put("endIdx", endIdx + 1);
		return session.selectList("questionboardns.getBoardList", map);
	}
}
