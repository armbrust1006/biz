package global.scit.bizcard.repository;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.scit.bizcard.dao.CardImageDAO;
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
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int setMyCardList(CardImage cardImage){
		CardImageDAO dao = sqlSession.getMapper(CardImageDAO.class);
		try {
			return dao.setMyCardList(cardImage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

}
