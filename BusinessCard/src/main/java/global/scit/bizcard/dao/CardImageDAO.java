package global.scit.bizcard.dao;

import global.scit.bizcard.vo.Card;
import global.scit.bizcard.vo.CardImage;

public interface CardImageDAO {

	public int saveCardImage(CardImage cardImage) throws Exception;

	public int updateCardImage(CardImage cardImage) throws Exception;

	public int deleteCardImage(CardImage cardImage) throws Exception;
	
	public int setMyCardList(CardImage cardImage) throws Exception;

	public int sharedChange(CardImage cardImage) throws Exception;

	public int getImageNumber(String m_id) throws Exception;

	public int loadCardImage(int cardNum) throws Exception;

	public String checkExistMine(String id) throws Exception;

	public Card setMyCardSharing(CardImage cardImage) throws Exception;

	public CardImage myCardExist(String m_id) throws Exception;
	
	//아래부터는 myHome 화면 보여주기
	//1. 보유 명함 개수
	public int countMyCardIndex(String m_id) throws Exception;

	public int countMyCardIndex(String m_id)  throws Exception;
	
}