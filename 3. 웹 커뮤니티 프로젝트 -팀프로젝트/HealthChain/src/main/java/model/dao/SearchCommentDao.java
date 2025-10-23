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
import model.SearchComment;

public class SearchCommentDao {
	private static SearchCommentDao instance = new SearchCommentDao();
	private final int limitBoardNum = 10;
	private final int limitPageNum = 10;

	private SearchCommentDao() {

	}

	public static SearchCommentDao getInstance() {
		return instance;
	}

	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println("SearchCommentDao session error");
			System.out.println(e.getMessage());
		}
	}
	
	public SearchComment select(String id) {
		return session.selectOne("searchcommentns.select", id);
	}
	
	public int getTotalByUserId(String id) {
		return session.selectOne("searchcommentns.getTotalByUserId", id);
	}
	
	public int getQsbCmtTotalByUserId(String id) {
		return session.selectOne("searchcommentns.getQsbCmtTotalByUserId", id);
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
	
	public PagingData getPagingDataByQsbCmtAndUserId(int page, String id) {
		PagingData pgData = new PagingData();
		int totalBoardNum = getQsbCmtTotalByUserId(id);

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
	
	public List<SearchComment> getCommentListByUserId(int startIdx, int endIdx, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIdx", startIdx + 1);
		map.put("endIdx", endIdx + 1);
		map.put("id", id);
		return session.selectList("searchcommentns.getCommentListByUserId", map);
	}
	
	public List<SearchComment> getQsbCommentListByUserId(int startIdx, int endIdx, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIdx", startIdx + 1);
		map.put("endIdx", endIdx + 1);
		map.put("id", id);
		return session.selectList("searchcommentns.getQsbCommentListByUserId", map);
	}
}
