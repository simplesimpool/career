import org.json.JSONArray;
import org.json.JSONObject;
import java.util.*;

public class BoardClient {
    public static void main(String[] args) {
        BoardServer boardServer = new BoardServer(31, 15, 10);
        Scanner sc = new Scanner(System.in);

        JSONObject res = reqBoards(boardServer, 2);
//        System.out.println(res);
        System.out.println("boardList : " + res.get("boardList"));
        System.out.println("page : " + res.get("page"));
        System.out.println("startPage : " + res.get("startPage"));
        System.out.println("endPage : " + res.get("endPage"));
        System.out.println("nextPage : " + res.get("nextPage"));
        System.out.println("prevPage : " + res.get("prevPage"));
    }
    public static JSONObject reqBoards(BoardServer boardServer, int page) {
        JSONObject req = new JSONObject();
        req.put("page", page);

        return boardServer.resBoards(req);
    }
}
