package global.scit.bizcard.dao;

import java.util.ArrayList;

import global.scit.bizcard.vo.Reply;

public interface ReplyDAO {

	public int replyInsert(Reply reply) throws Exception;

	public ArrayList<Reply> replyList(int book_num) throws Exception;

	/*
	 * public int replyUpdate() throws Exception;
	 * 
	 * public int replyDelete() throws Exception;
	 */
}
