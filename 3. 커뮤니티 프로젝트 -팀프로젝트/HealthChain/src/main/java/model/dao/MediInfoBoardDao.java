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
import model.MediInfoBoard;
import model.PagingData;

public class MediInfoBoardDao {
	private static MediInfoBoardDao instance = new MediInfoBoardDao();
	private final int limitBoardNum = 15;
	private final int limitPageNum = 10;

	private MediInfoBoardDao() {

	}

	public static MediInfoBoardDao getInstance() {
		return instance;
	}

	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println("MediInfoBoardDao session error");
			System.out.println(e.getMessage());
		}
	}

	public MediInfoBoard select(String id) {
		return session.selectOne("mediinfoboardns.select", id);
	}

	public int insert(MediInfoBoard mib) {
		return session.insert("mediinfoboardns.insert", mib);
	}

	public int getTotal() {
		return session.selectOne("mediinfoboardns.getTotal");
	}
	
	public int getTotalByUserId(String id) {
		return session.selectOne("mediinfoboardns.getTotalByUserId", id);
	}
	
	public int getNoticeTotal() {
		return session.selectOne("mediinfoboardns.getNoticeTotal");
	}
	
	public int getIndex(String id) {
		return session.selectOne("mediinfoboardns.getIndex", id);
	}
	
	public int update(MediInfoBoard mib) {
		return session.update("mediinfoboardns.update", mib);
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
	
	public List<MediInfoBoard> getBoardListByNotice(int startIdx, int endIdx) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIdx", startIdx + 1);
		map.put("endIdx", endIdx + 1);
		return session.selectList("mediinfoboardns.getBoardListByNotice", map);
	}
	
	public List<MediInfoBoard> getBoardListByUserId(int startIdx, int endIdx, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIdx", startIdx + 1);
		map.put("endIdx", endIdx + 1);
		map.put("id", id);
		return session.selectList("mediinfoboardns.getBoardListByUserId", map);
	}

	public List<MediInfoBoard> getBoardList(int startIdx, int endIdx) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIdx", startIdx + 1);
		map.put("endIdx", endIdx + 1);
		return session.selectList("mediinfoboardns.getBoardList", map);
	}
}
