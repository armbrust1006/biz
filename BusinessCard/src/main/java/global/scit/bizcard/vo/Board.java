package global.scit.bizcard.vo;

public class Board {
	
		int book_num;
		int boardnum;
		String m_id;
		String board_title;
		String board_content;
		String inputdate;
		int board_hits;
		
		public int getBook_num() {
			return book_num;
		}
		public void setBook_num(int book_num) {
			this.book_num = book_num;
		}
		public int getBoardnum() {
			return boardnum;
		}
		public void setBoardnum(int boardnum) {
			this.boardnum = boardnum;
		}
		public String getM_id() {
			return m_id;
		}
		public void setM_id(String m_id) {
			this.m_id = m_id;
		}
		public String getBoard_title() {
			return board_title;
		}
		public void setBoard_title(String board_title) {
			this.board_title = board_title;
		}
		public String getBoard_content() {
			return board_content;
		}
		public void setBoard_content(String board_content) {
			this.board_content = board_content;
		}
		public String getInputdate() {
			return inputdate;
		}
		public void setInputdate(String inputdate) {
			this.inputdate = inputdate;
		}
		public int getBoard_hits() {
			return board_hits;
		}
		public void setBoard_hits(int board_hits) {
			this.board_hits = board_hits;
		}
		@Override
		public String toString() {
			return "Board [book_num=" + book_num + ", boardnum=" + boardnum + ", m_id=" + m_id + ", board_title="
					+ board_title + ", board_content=" + board_content + ", inputdate=" + inputdate + ", board_hits="
					+ board_hits + "]";
		}
		
	

	}

