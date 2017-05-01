package global.scit.bizcard.dao;

import java.util.ArrayList;
import java.util.HashMap;

import global.scit.bizcard.vo.Board;


public interface BoardDAO {
	public int insertB(HashMap<String, Object> map);
	public ArrayList<Board> listB(int book_num);
	public Board readB(int boardnum);
	public int deleteB(HashMap<String, Object> map);
	public int updateB(HashMap<String, Object> map);
	public void updateHits(int boardnum, int hits);
}
