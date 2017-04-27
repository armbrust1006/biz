package global.scit.bizcard.dao;

import java.util.List;
import java.util.Map;

import global.scit.bizcard.vo.Card;

public interface CardDAO {

	public int insertCard(Card card) throws Exception;

	public int updateCard(Card card) throws Exception;

	public List<Card> myCardListData(Map<String, Object> sortMap) throws Exception;

	public List<Card> getOCRMachining(String mach) throws Exception;

	public Card selectOneCard(Card c) throws Exception;

	public List<Card> searchCards(Map<String, Object> sortMap) throws Exception;

	public int shareCheck(int cardnum, int book_num) throws Exception;

	public int share(int book_num, int cardnum, String m_id) throws Exception;

	public String myAddress(String m_id) throws Exception; // selectOneCard 요청 시
															// '나의 주소' 가져옴

}
