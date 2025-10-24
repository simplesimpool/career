package model.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.FreeBoard;
import model.PagingData;
import model.ReviewBoard;

public class ReviewBoardDao {
	private static ReviewBoardDao instance = new ReviewBoardDao();
	private final int limitBoardNum = 15;
	private final int limitPageNum = 10;

	private ReviewBoardDao() {

	}

	public static ReviewBoardDao getInstance() {
		return instance;
	}

	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println("ReviewBoardDao session error");
			System.out.println(e.getMessage());
		}
	}
	public int update(ReviewBoard rvb) {
		return session.update("reviewboardns.update", rvb);
	}
	
	public int insert(ReviewBoard rvb) {
		return session.insert("reviewboardns.insert", rvb);
	}
	
	public int getTotal() {
		return session.selectOne("reviewboardns.getTotal");
	}
	
	public int getTotalByUserId(String id) {
		return session.selectOne("reviewboardns.getTotalByUserId", id);
	}
	
	public int getNoticeTotal() {
		return session.selectOne("reviewboardns.getNoticeTotal");
	}
	
	public int getIndexByDate(String id) {
		return session.selectOne("reviewboardns.getIndexByDate", id);
	}
	
	public int getIndexByLike(String id) {
		return session.selectOne("reviewboardns.getIndexByLike", id);
	}
	
	public ReviewBoard select(String id) {
		return session.selectOne("reviewboardns.select", id);
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
	
	public List<ReviewBoard> getBoardListByNotice(int startIdx, int endIdx) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIdx", startIdx + 1);
		map.put("endIdx", endIdx + 1);
		return session.selectList("reviewboardns.getBoardListByNotice", map);
	}
	
	public List<ReviewBoard> getBoardListByUserId(int startIdx, int endIdx, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIdx", startIdx + 1);
		map.put("endIdx", endIdx + 1);
		map.put("id", id);
		return session.selectList("reviewboardns.getBoardListByUserId", map);
	}
	
	public List<ReviewBoard> getBoardListByDate(int startIdx, int endIdx) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIdx", startIdx + 1);
		map.put("endIdx", endIdx + 1);
		return session.selectList("reviewboardns.getBoardListByDate", map);
	}
	
	public List<ReviewBoard> getBoardListByLike(int startIdx, int endIdx) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIdx", startIdx + 1);
		map.put("endIdx", endIdx + 1);
		return session.selectList("reviewboardns.getBoardListByLike", map);
	}
}
