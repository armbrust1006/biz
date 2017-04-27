package global.scit.bizcard.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.scit.bizcard.dao.CardImageDAO;
import global.scit.bizcard.vo.Card;
import global.scit.bizcard.vo.CardImage;

@Repository
public class CardImageRepository implements CardImageDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int saveCardImage(CardImage cardImage) {
		CardImageDAO dao = sqlSession.getMapper(CardImageDAO.class);
		try {
			return dao.saveCardImage(cardImage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int getImageNumber(String m_id) {
		CardImageDAO dao = sqlSession.getMapper(CardImageDAO.class);
		try {
			int a = dao.getImageNumber(m_id);
			System.out.println(a);
			return a;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int loadCardImage(int cardNum) {
		CardImageDAO dao = sqlSession.getMapper(CardImageDAO.class);
		try {
			return dao.loadCardImage(cardNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public String checkExistMine(String id) {
		CardImageDAO dao = sqlSession.getMapper(CardImageDAO.class);
		String result = null;
		try {
			result = dao.checkExistMine(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int setMyCardList(CardImage cardImage) {
		CardImageDAO dao = sqlSession.getMapper(CardImageDAO.class);
		try {
			return dao.setMyCardList(cardImage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public Card setMyCardSharing(CardImage cardImage) {
		CardImageDAO dao = sqlSession.getMapper(CardImageDAO.class);
		try {
			return dao.setMyCardSharing(cardImage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int sharedChange(CardImage cardImage) {
		CardImageDAO dao = sqlSession.getMapper(CardImageDAO.class);
		try {
			return dao.sharedChange(cardImage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public CardImage myCardExist(String m_id) {
		CardImageDAO dao = sqlSession.getMapper(CardImageDAO.class);
		try {
			return dao.myCardExist(m_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	   @Override
	   public int countMyCardIndex(String m_id) {
	      int result = 0;
	      CardImageDAO dao = sqlSession.getMapper(CardImageDAO.class);
	      try {
	         result = dao.countMyCardIndex(m_id);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return result;
	   }

	@Override
	public int updateCardImage(CardImage cardImage) {
		CardImageDAO dao = sqlSession.getMapper(CardImageDAO.class);
		try {
			return dao.updateCardImage(cardImage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	   public int deleteCardImage(CardImage cardImage) {
	      CardImageDAO dao = sqlSession.getMapper(CardImageDAO.class);
	      try {
	         return dao.deleteCardImage(cardImage);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return 0;
	   }
	
	
	
}
