package global.scit.bizcard.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.scit.bizcard.repository.ReplyRepository;
import global.scit.bizcard.repository.SharingRepository;
import global.scit.bizcard.vo.Reply;

@Controller
public class ReplyController {

	@Autowired
	SharingRepository sharingRepository;

	@Autowired
	ReplyRepository replyRepository;

	// 공유된 명함 이미지 클릭시
	@RequestMapping(value = "/sharedCard", method = RequestMethod.GET)
	public String sharedCard(int cardnum, int book_num, Model model) {
		HashMap<String, Object> sharedCard = new HashMap<String, Object>();
		sharedCard = sharingRepository.getOneSharedCard(cardnum, book_num);
		model.addAttribute("sharedCard", sharedCard);
		System.out.println("하나가져오기" + sharedCard.toString());
		return "sharingCards/sharedCard";
	}

	/**
	 * [현택] 댓글 등록
	 * 
	 * @param session
	 * @param Reply
	 * @return int
	 */
	@ResponseBody
	@RequestMapping(value = "replyInsert", method = RequestMethod.POST)
	public int replyInsert(HttpSession session, Reply reply) {
		ArrayList<Reply> rList = new ArrayList<>();
		String m_id = (String) session.getAttribute("m_id");
		reply.setM_id(m_id);
		return replyRepository.replyInsert(reply);
	}

	/**
	 * [현택] 댓글 전체 가져오기
	 * 
	 * @param Reply
	 * @param session
	 * @return ArrayList
	 */
	@ResponseBody
	@RequestMapping(value = "/replyList", method = RequestMethod.GET)
	public ArrayList<Reply> replyList(int shared_cardnum, Reply reply) {
		System.out.println(shared_cardnum+"의");
		System.out.println("sharedCardNum"+reply.toString());
		ArrayList<Reply> replyList = new ArrayList<>();
		replyList = replyRepository.replyList(shared_cardnum);
		System.out.println("댓글전체가져오기"+replyList.toString());
		return replyList;
	}

}
