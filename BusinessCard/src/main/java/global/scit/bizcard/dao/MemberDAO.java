package global.scit.bizcard.dao;

import java.util.Map;
import global.scit.bizcard.vo.Member;

public interface MemberDAO {
	public Member selectM(Map<String, String> mMap) throws Exception;
	public int insertM(Member member) throws Exception;
	public Member emailCheck(String m_email) throws Exception;
	public Member idCheck(String id) throws Exception;
	public String getEmail(String id) throws Exception;
}
