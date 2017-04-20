package global.scit.bizcard.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.scit.bizcard.dao.SharingDAO;
import global.scit.bizcard.vo.CardBooks;
import global.scit.bizcard.vo.Member;
import global.scit.bizcard.vo.Message;

@Repository
public class SharingRepository {
	@Autowired
	SqlSession sql;

	public ArrayList<CardBooks> listCardBooks(String m_id) {
		SharingDAO dao = sql.getMapper(SharingDAO.class);
		try {
			return dao.listCardBooks(m_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int makeRoom(CardBooks card) {
		SharingDAO dao = sql.getMapper(SharingDAO.class);
		try {
			return dao.makeRoom(card);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public List<HashMap<String, Object>> selectOneRoom(int book_num) {
		SharingDAO dao = sql.getMapper(SharingDAO.class);
		try {
			return dao.selectOneRoom(book_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<Member> inviteList(String searchTitle, String searchText) {
		Map<String, String> search = new HashMap<>();
		search.put("searchTitle", searchTitle);
		search.put("searchText", searchText);
		SharingDAO dao = sql.getMapper(SharingDAO.class);
		try {
			ArrayList<Member> iList = dao.inviteList(search);
			return iList;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public int invite(Message message) {
		SharingDAO dao = sql.getMapper(SharingDAO.class);
		try {
			return dao.invite(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public ArrayList<Message> messageList(String m_id) {
		SharingDAO dao = sql.getMapper(SharingDAO.class);
		try {
			return dao.messageList(m_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public int writeMessage(Message message) {
		SharingDAO dao = sql.getMapper(SharingDAO.class);
		try {
			return dao.writeMessage(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int readMessage(Message message) {
		SharingDAO dao = sql.getMapper(SharingDAO.class);
		try {
			return dao.readMessage(message);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int joinRoom(CardBooks card) {
		SharingDAO dao = sql.getMapper(SharingDAO.class);
		try {
			return dao.joinRoom(card);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

}
