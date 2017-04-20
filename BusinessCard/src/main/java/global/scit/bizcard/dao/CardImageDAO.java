package global.scit.bizcard.dao;

import java.util.Map;

import global.scit.bizcard.vo.CardImage;

public interface CardImageDAO {

	public int saveCardImage(CardImage cardImage) throws Exception;
	
	public int setMyCardList(CardImage cardImage) throws Exception;

	public int getImageNumber(String m_id) throws Exception;

	public int loadCardImage(int cardNum) throws Exception;
	
	public String checkExistMine(String id) throws Exception;
}
