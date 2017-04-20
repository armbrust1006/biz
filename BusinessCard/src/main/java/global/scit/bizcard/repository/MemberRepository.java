package global.scit.bizcard.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.scit.bizcard.dao.MemberDAO;
import global.scit.bizcard.vo.Member;


@Repository
public class MemberRepository {
	
	@Autowired
	SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberRepository.class);
	
	public Member selectM (Member member) {
		System.out.println(member+"received at repoitory");
		MemberDAO mdao = sqlSession.getMapper(MemberDAO.class);
		Map<String, String> mMap = new HashMap<>();
		mMap.put("m_id", member.getM_id());
		mMap.put("m_password", member.getM_password());
		Member result = null;
		try {
			result = mdao.selectM(mMap);
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	} 
	
	public int insertM(Member member) {
		MemberDAO mdao = sqlSession.getMapper(MemberDAO.class);
		int result  = 0;
		
		try {
			result = mdao.insertM(member);
			logger.info(result + " 개의 데이터 저장 완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	  public Member idCheck(String id){
	      MemberDAO mdao = sqlSession.getMapper(MemberDAO.class);
	      
	      Member a =null;
	      try {
	         a = mdao.idCheck(id);
	      } catch (Exception e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      return a;
	   }
	  
	  public Member emailCheck(String email){
	         MemberDAO mdao = sqlSession.getMapper(MemberDAO.class);
	         
	         Member b =null;
	         try {
	            b = mdao.emailCheck(email);
	         } catch (Exception e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
	         
	         return b;
	      }


}
