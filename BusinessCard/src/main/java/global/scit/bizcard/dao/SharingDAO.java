package global.scit.bizcard.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import global.scit.bizcard.vo.CardBooks;
import global.scit.bizcard.vo.CardImage;
import global.scit.bizcard.vo.Member;
import global.scit.bizcard.vo.Message;

public interface SharingDAO {

	public ArrayList<HashMap<String, Object>> listCardBooks(String m_id) throws Exception;

	public int makeRoom(CardBooks card) throws Exception;

	public int getBookNum(CardBooks card) throws Exception;

	public int insertManager(CardBooks card) throws Exception;

	public List<HashMap<String, Object>> selectOneRoom(int book_bum) throws Exception;

	public List<HashMap<String, Object>> allMember(int book_bum) throws Exception;

	public ArrayList<Member> inviteList(Map<String, String> search) throws Exception;

	public int invite(Message message) throws Exception;

	public ArrayList<Message> messageList(String m_id) throws Exception;

	public int writeMessage(Message message) throws Exception;

	public int readMessage(Message message) throws Exception;

	public int joinRoom(CardBooks card) throws Exception;

	public int leaveRoom(CardBooks card) throws Exception;

	public List<CardImage> getRoomCards(int card) throws Exception;

	public HashMap<String, Object> getOneSharedCard(int cardnum, int book_num) throws Exception;

	public int delMessage(Message message) throws Exception;

}
