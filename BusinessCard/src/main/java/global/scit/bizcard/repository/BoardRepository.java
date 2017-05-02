package global.scit.bizcard.repository;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.scit.bizcard.dao.BoardDAO;
import global.scit.bizcard.vo.Board;

@Repository
public class BoardRepository {

	@Autowired
	SqlSession sqlSession;

	public int insertB(int book_num, String board_title, String board_content, String id) {
		BoardDAO mapper = sqlSession.getMapper(BoardDAO.class);
		HashMap<String, Object> map = new HashMap<>();
		map.put("booknum", book_num);
		map.put("board_title", board_title);
		map.put("board_content", board_content);
		map.put("id", id);
		return mapper.insertB(map);
	}

	public ArrayList<Board> listB(int book_num) {
		BoardDAO mapper = sqlSession.getMapper(BoardDAO.class);
		ArrayList<Board> listB = mapper.listB(book_num);
		return listB;
	}

	public Board readB(int boardnum) {
		BoardDAO mapper = sqlSession.getMapper(BoardDAO.class);
		Board board = mapper.readB(boardnum);
		int hits = board.getBoard_hits() + 1;
		mapper.updateHits(boardnum, hits);
		Board readB = mapper.readB(boardnum);
		return readB;
	}

	public int deleteB(int boardnum, int book_num) {
		BoardDAO mapper = sqlSession.getMapper(BoardDAO.class);
		HashMap<String, Object> map = new HashMap<>();
		map.put("boardnum", boardnum);
		map.put("book_num", book_num);
		return mapper.deleteB(map);
	}

	public int updateB(int boardnum, int book_num, String content) {
		BoardDAO mapper = sqlSession.getMapper(BoardDAO.class);

		HashMap<String, Object> map = new HashMap<>();
		map.put("boardnum", boardnum);
		map.put("book_num", book_num);
		map.put("content", content);

		return mapper.updateB(map);
	}

}
