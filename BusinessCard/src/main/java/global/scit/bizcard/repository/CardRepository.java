package global.scit.bizcard.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.scit.bizcard.dao.CardDAO;
import global.scit.bizcard.vo.Card;

@Repository
public class CardRepository implements CardDAO {

	@Autowired
	private SqlSession sqlsession;

	@Override
	public int insertCard(Card card) {
		CardDAO dao = sqlsession.getMapper(CardDAO.class);
		try {
			return dao.insertCard(card);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<Card> myCardListData(Map<String, Object> sortMap) {
		CardDAO dao = sqlsession.getMapper(CardDAO.class);
		try {
			return dao.myCardListData(sortMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Card selectOneCard(Card c) {
		CardDAO dao = sqlsession.getMapper(CardDAO.class);
		System.out.println(c);
		try {
			return dao.selectOneCard(c);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int shareCheck(int cardnum, int book_num) {
		CardDAO dao = sqlsession.getMapper(CardDAO.class);
		int result = 0;
		try {
			result = dao.shareCheck(cardnum, book_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int share(String m_id, int book_num, int cardnum) {
		CardDAO dao = sqlsession.getMapper(CardDAO.class);
		try {
			return dao.share(m_id, book_num, cardnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<Card> searchCards(Map<String, Object> sortMap) {
		CardDAO dao = sqlsession.getMapper(CardDAO.class);
		try {
			return dao.searchCards(sortMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Card> getOCRMachining(String mach) {
		CardDAO dao = sqlsession.getMapper(CardDAO.class);
		try {
			return dao.getOCRMachining(mach);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int updateCard(Card card) {
		CardDAO dao = sqlsession.getMapper(CardDAO.class);
		try {
			return dao.updateCard(card);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

}
