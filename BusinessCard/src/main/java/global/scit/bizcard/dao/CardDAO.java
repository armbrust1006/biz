package global.scit.bizcard.dao;

import java.util.List;
import java.util.Map;

import global.scit.bizcard.vo.Card;

public interface CardDAO {

	public int insertCard(Card card) throws Exception;

	public List<Card> myCardListData(Map<String, Object> sortMap) throws Exception;

	public List<Card> getOCRMachData(String mach) throws Exception;

	public Card selectOneCard(Card c) throws Exception;

	public List<Card> searchCards(Map<String, Object> sortMap) throws Exception;

	public int shareCheck(int cardnum, int book_num) throws Exception;

	public int share(String m_id, int book_num, int cardnum) throws Exception;

	public Card selectMyCard(String loginID) throws Exception;
}
