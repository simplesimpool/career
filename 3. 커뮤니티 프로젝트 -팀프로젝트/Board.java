public class Board {
    private String boardID;

    public Board(String boardID) {
        this.boardID = boardID;
    }
    public String getBoardIdx() {
        return boardID;
    }
    public void setBoardID(String boardID) {
        this.boardID = boardID;
    }
}
