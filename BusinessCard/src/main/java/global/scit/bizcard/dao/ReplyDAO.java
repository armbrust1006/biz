package global.scit.bizcard.dao;

import java.util.ArrayList;
import java.util.HashMap;

import global.scit.bizcard.vo.Reply;

public interface ReplyDAO {

	public int replyInsert(Reply reply) throws Exception;

	public ArrayList<Reply> replyList(int shared_cardnum) throws Exception;

	public int replyDelete(int reply_num) throws Exception;

	public int replyUpdate(Reply reply) throws Exception;

	public HashMap<String, Object> shareCount(int book_num) throws Exception; //공유왕
	
	public HashMap<String, Object> replyCount(int book_num, int cardnum) throws Exception; //댓글왕
	
	
	
}
