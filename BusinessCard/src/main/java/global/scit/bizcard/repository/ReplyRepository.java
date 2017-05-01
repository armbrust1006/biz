package global.scit.bizcard.repository;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.scit.bizcard.dao.ReplyDAO;
import global.scit.bizcard.vo.Reply;

@Repository
public class ReplyRepository implements ReplyDAO {

	@Autowired
	SqlSession sql;

	@Override
	public int replyInsert(Reply reply) {
		ReplyDAO dao = sql.getMapper(ReplyDAO.class);
		try {
			return dao.replyInsert(reply);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}

	@Override
	public ArrayList<Reply> replyList(int shared_cardnum) {
		ReplyDAO dao = sql.getMapper(ReplyDAO.class);
		try {
			return dao.replyList(shared_cardnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int replyDelete(int reply_num) {
		ReplyDAO dao = sql.getMapper(ReplyDAO.class);
		try {
			return dao.replyDelete(reply_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int replyUpdate(Reply reply) {
		ReplyDAO dao = sql.getMapper(ReplyDAO.class);
		try {
			return dao.replyUpdate(reply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public HashMap<String, Object> shareCount(int book_num) {
		ReplyDAO dao = sql.getMapper(ReplyDAO.class);
		try {
			return dao.shareCount(book_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public HashMap<String, Object> replyCount(int book_num, int cardnum) {
		ReplyDAO dao = sql.getMapper(ReplyDAO.class);
		try {
			return dao.replyCount(book_num, cardnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
