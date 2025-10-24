import org.json.JSONObject;
import org.json.JSONArray;
import java.util.*;

public class BoardServer {
    private ArrayList<Board> boards = new ArrayList<Board>();
    private int totalBoardNum;
    private int limitBoardNum;
    private int limitPageNum;

    public BoardServer(int totalBoardNum, int limitBoardNum, int limitPageNum) {
        this.totalBoardNum = totalBoardNum;
        this.limitBoardNum = limitBoardNum;
        this.limitPageNum = limitPageNum;

        for(int i = 0; i < totalBoardNum; i++) {
            String idx = "" + i;
            boards.add(new Board(idx));
        }
    }
    public JSONObject resBoards(JSONObject req) {
        JSONObject res = new JSONObject();

        int maxPage;
        if(totalBoardNum <= 0) {
            maxPage = 1;
        }
        else if(totalBoardNum % limitBoardNum == 0) {
            maxPage = totalBoardNum / limitBoardNum;
        }
        else {
            maxPage = (totalBoardNum / limitBoardNum) + 1;
        }
        System.out.println("maxPage : " + maxPage);
        int reqPage = req.getInt("page");
        if(reqPage < 1) {
            reqPage = 1;
        }
        else if(reqPage > maxPage) {
            reqPage = maxPage;
        }
        res.put("page", reqPage);

        int startIdx = limitBoardNum * (reqPage - 1);
        int endIdx = limitBoardNum * reqPage - 1;

        JSONArray boardList = new JSONArray();

        if(totalBoardNum <= endIdx) {
            endIdx = totalBoardNum - 1;
        }

        System.out.println("startIdx : " + startIdx);
        System.out.println("endIdx : " + endIdx);
        if(totalBoardNum != 0) {
            for(int i = startIdx; i <= endIdx; i++) {
                boardList.put(boards.get(i).getBoardIdx());
            }
        }
//        try {
//            for(int i = startIdx; i <= endIdx; i++) {
//                boardList.put(boards.get(i).getBoardID());
//            }
//        }
//        catch (Exception e) {
//
//        }
        res.put("boardList", boardList);

        int startPage = limitPageNum * ((reqPage - 1) / limitPageNum) + 1;
        int endPage = (((reqPage - 1) / limitPageNum) + 1) * limitPageNum;
        //int endPage = startPage + limitPageNum - 1;
        if(maxPage <= endPage) {
            endPage = maxPage;
        }
        res.put("startPage", startPage);
        res.put("endPage", endPage);

//        int nextPage = startPage + limitPageNum;
//        int prevPage = endPage - limitPageNum;
        int nextPage = endPage + 1;
        int prevPage = startPage - 1;

        if(nextPage > maxPage) {
            nextPage = maxPage;
        }
        if(prevPage < 1) {
            prevPage = 1;
        }

        res.put("nextPage", nextPage);
        res.put("prevPage", prevPage);

        return res;
    }
    public ArrayList<Board> getBoards() {
        return boards;
    }
}
