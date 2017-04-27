package global.scit.bizcard.repository;

import java.util.ArrayList;

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

	/*
	@Override
	public int replyUpdate() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int replyDelete() {
		// TODO Auto-generated method stub
		return 0;
	}
*/
}
