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
import global.scit.bizcard.vo.CardImage;
import global.scit.bizcard.vo.Member;
import global.scit.bizcard.vo.Message;

@Repository
public class SharingRepository {
   @Autowired
   SqlSession sql;

   public ArrayList<HashMap<String, Object>> listCardBooks(String m_id) {
      ArrayList<HashMap<String, Object>> bookList = new ArrayList<HashMap<String, Object>>();
      SharingDAO dao = sql.getMapper(SharingDAO.class);
      try {
         bookList = dao.listCardBooks(m_id);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return bookList;
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

   public int getBookNum(CardBooks card) {
      int result = 0;
      SharingDAO dao = sql.getMapper(SharingDAO.class);
      try {
         result = dao.getBookNum(card);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return result;

   }

   public int insertManager(CardBooks card) {
      SharingDAO dao = sql.getMapper(SharingDAO.class);
      try {
         return dao.insertManager(card);
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

   public List<HashMap<String, Object>> allMember(int book_num) {
      SharingDAO dao = sql.getMapper(SharingDAO.class);
      try {
         return dao.allMember(book_num);
      } catch (Exception e) {
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

   public int joinRoom(CardBooks card) {
      SharingDAO dao = sql.getMapper(SharingDAO.class);
      try {
         return dao.joinRoom(card);
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

   public int leaveRoom(CardBooks card) {
      SharingDAO dao = sql.getMapper(SharingDAO.class);
      try {
         return dao.leaveRoom(card);
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return 0;
   }

   public List<CardImage> getRoomCards(int card) {
      SharingDAO dao = sql.getMapper(SharingDAO.class);
      try {
         return dao.getRoomCards(card);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return null;
   }

   public HashMap<String, Object> getOneSharedCard(int cardnum, int book_num) {
      HashMap<String, Object> sharedCard = new HashMap<String, Object>();
      SharingDAO dao = sql.getMapper(SharingDAO.class);
      try {
         sharedCard = dao.getOneSharedCard(cardnum, book_num);
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return sharedCard;
   }

}