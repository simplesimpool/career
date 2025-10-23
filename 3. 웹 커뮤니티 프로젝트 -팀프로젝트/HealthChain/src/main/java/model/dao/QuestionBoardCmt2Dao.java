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
import model.QuestionBoardCmt2;

public class QuestionBoardCmt2Dao {
	private static QuestionBoardCmt2Dao instance = new QuestionBoardCmt2Dao();
	private final int limitBoardNum = 10;
	private final int limitPageNum = 10;

	private QuestionBoardCmt2Dao() {

	}

	public static QuestionBoardCmt2Dao getInstance() {
		return instance;
	}

	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println("QuestionBoardCmt2Dao session error");
			System.out.println(e.getMessage());
		}
	}
	public int update(QuestionBoardCmt2 qsbCmt2) {
		return session.update("questionboardcmt2ns.update", qsbCmt2);
	}
	
	public QuestionBoardCmt2 select(String id) {
		return session.selectOne("questionboardcmt2ns.select", id);
	}

	public int insert(QuestionBoardCmt2 qsbCmt2) {
		return session.insert("questionboardcmt2ns.insert", qsbCmt2);
	}
	
	public int reply(QuestionBoardCmt2 qsbCmt2) {
		return session.insert("questionboardcmt2ns.reply", qsbCmt2);
	}
	
	public int deleteTreeByQsbCmtId(String id) {
		return session.update("questionboardcmt2ns.deleteTreeByQsbCmtId", id);
	}
	
	public int deleteTreeByQsbId(String id) {
		return session.update("questionboardcmt2ns.deleteTreeByQsbId", id);
	}
	
	public int deleteTree(String id) {
		return session.update("questionboardcmt2ns.deleteTree", id);
	}
	
	public int getIndex(String qsbId, String qsbCmtId, String qsbCmt2Id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qsbId", qsbId);
		map.put("qsbCmtId", qsbCmtId);
		map.put("qsbCmt2Id", qsbCmt2Id);
		return session.selectOne("questionboardcmt2ns.getIndex", map);
	}

	public int getTotalByQsbIdAndQsbCmtId(String qsbId, String qsbCmtId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qsbId", qsbId);
		map.put("qsbCmtId", qsbCmtId);
		return session.selectOne("questionboardcmt2ns.getTotalByQsbIdAndQsbCmtId", map);
	}

	public PagingData getPagingData(int page, String qsbId, String qsbCmtId) {
		PagingData pgData = new PagingData();
		int totalBoardNum = getTotalByQsbIdAndQsbCmtId(qsbId, qsbCmtId);

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

	public List<QuestionBoardCmt2> getCommentList(int startIdx, int endIdx, String qsbId, String qsbCmtId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIdx", startIdx + 1);
		map.put("endIdx", endIdx + 1);
		map.put("qsbId", qsbId);
		map.put("qsbCmtId", qsbCmtId);
		return session.selectList("questionboardcmt2ns.getCommentList", map);
	}
}
