package model.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.FreeBoardCmt;
import model.PagingData;
import model.ReviewBoard;
import model.ReviewBoardCmt;

public class ReviewBoardCmtDao {
	private static ReviewBoardCmtDao instance = new ReviewBoardCmtDao();
	private final int limitBoardNum = 10;
	private final int limitPageNum = 10;

	private ReviewBoardCmtDao() {
		
	}

	public static ReviewBoardCmtDao getInstance() {
		return instance;
	}

	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println("ReviewBoardCmtDao session error");
			System.out.println(e.getMessage());
		}
	}

	public PagingData getPagingData(int page, String rvbId) {
		PagingData pgData = new PagingData();
		int totalBoardNum = getTotalByRvbId(rvbId);

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

	public int insert(ReviewBoardCmt rvbCmt) {
		return session.insert("reviewboardcmtns.insert", rvbCmt);
	}

	public int getTotalByRvbId(String rvbId) {
		return session.selectOne("reviewboardcmtns.getTotalByRvbId", rvbId);
	}
	
	public int getTotalByUserId(String id) {
		return session.selectOne("reviewboardcmtns.getTotalByUserId", id);
	}
	
	public int getIndex(String rvbId, String rvbCmtId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rvbId", rvbId);
		map.put("rvbCmtId", rvbCmtId);
		return session.selectOne("reviewboardcmtns.getIndex", map);
	}

	public List<ReviewBoardCmt> getCommentList(int startIdx, int endIdx, String rvbId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIdx", startIdx + 1);
		map.put("endIdx", endIdx + 1);
		map.put("rvbId", rvbId);
		return session.selectList("reviewboardcmtns.getCommentList", map);
	}
	
	public List<ReviewBoardCmt> getCommentListByUserId(int startIdx, int endIdx, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIdx", startIdx + 1);
		map.put("endIdx", endIdx + 1);
		map.put("id", id);
		return session.selectList("reviewboardcmtns.getCommentListByUserId", map);
	}

	public ReviewBoardCmt select(String id) {
		return session.selectOne("reviewboardcmtns.select", id);
	}

	public int update(ReviewBoardCmt rvbCmt) {
		return session.update("reviewboardcmtns.update", rvbCmt);
	}
	
	public int deleteTreeByRvbId(String id) {
		return session.update("reviewboardcmtns.deleteTreeByRvbId", id);
	}
}
