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
import model.FreeBoardCmt;
import model.PagingData;

public class FreeBoardCmtDao {
	private static FreeBoardCmtDao instance = new FreeBoardCmtDao();
	private final int limitBoardNum = 10;
	private final int limitPageNum = 10;

	private FreeBoardCmtDao() {
		
	}

	public static FreeBoardCmtDao getInstance() {
		return instance;
	}

	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println("FreeBoardCmtDao session error");
			System.out.println(e.getMessage());
		}
	}

	public int update(FreeBoardCmt frbCmt) {
		return session.update("freeboardcmtns.update", frbCmt);
	}

	public int insert(FreeBoardCmt frbCmt) {
		return session.insert("freeboardcmtns.insert", frbCmt);
	}

	public int getTotalByFrbId(String frbId) {
		return session.selectOne("freeboardcmtns.getTotalByFrbId", frbId);
	}
	
	public int getTotalByUserId(String id) {
		return session.selectOne("freeboardcmtns.getTotalByUserId", id);
	}
	
	public int getIndex(String frbId, String frbCmtId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("frbId", frbId);
		map.put("frbCmtId", frbCmtId);
		return session.selectOne("freeboardcmtns.getIndex", map);
	}

	public FreeBoardCmt select(String id) {
		return session.selectOne("freeboardcmtns.select", id);
	}

	public PagingData getPagingData(int page, String frbId) {
		PagingData pgData = new PagingData();
		int totalBoardNum = getTotalByFrbId(frbId);

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

	public List<FreeBoardCmt> getCommentList(int startIdx, int endIdx, String frbId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIdx", startIdx + 1);
		map.put("endIdx", endIdx + 1);
		map.put("frbId", frbId);
		return session.selectList("freeboardcmtns.getCommentList", map);
	}
	
	public List<FreeBoardCmt> getCommentListByUserId(int startIdx, int endIdx, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIdx", startIdx + 1);
		map.put("endIdx", endIdx + 1);
		map.put("id", id);
		return session.selectList("freeboardcmtns.getCommentListByUserId", map);
	}
	
	public int deleteTreeByFrbId(String id) {
		return session.update("freeboardcmtns.deleteTreeByFrbId", id);
	}
}
