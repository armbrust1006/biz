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

import global.scit.bizcard.repository.CardRepository;
import global.scit.bizcard.repository.ReplyRepository;
import global.scit.bizcard.repository.SharingRepository;
import global.scit.bizcard.vo.Reply;

@Controller
public class ReplyController {

	@Autowired
	SharingRepository sharingRepository;

	@Autowired
	ReplyRepository replyRepository;

	@Autowired
	CardRepository cardRepository;

	// 공유된 명함 이미지 클릭시
	@RequestMapping(value = "/sharedCard", method = RequestMethod.GET)
	public String sharedCard(int cardnum, int book_num, HttpSession session, Model model) {
		HashMap<String, Object> sharedCard = new HashMap<String, Object>();
		sharedCard = sharingRepository.getOneSharedCard(cardnum, book_num);
		model.addAttribute("sharedCard", sharedCard);
		System.out.println("공유카드1장: " + sharedCard);

		// 내 주소 저장
		String loginID = (String) session.getAttribute("m_id");
		String myAddress = cardRepository.myAddress(loginID);
		model.addAttribute("myAddressForReply", myAddress);

		// 공유왕 뽑아오기
		HashMap<String, Object> shareCount = replyRepository.shareCount(book_num);
		model.addAttribute("shareCount", shareCount);
		System.out.println("공유왕: " + shareCount.toString());

		// 댓글왕 뽑아오기
		HashMap<String, Object> replyCount = replyRepository.replyCount(book_num, cardnum);
		model.addAttribute("replyCount", replyCount);
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
	@RequestMapping(value = "/replyList", method = RequestMethod.POST)
	public ArrayList<Reply> replyList(int shared_cardnum, Reply reply) {
		ArrayList<Reply> replyList = new ArrayList<>();
		replyList = replyRepository.replyList(shared_cardnum);
		return replyList;
	}

	/**
	 * [현택] 댓글 삭제
	 * 
	 * @param session
	 * @param Reply(reply_num,
	 *            writer)
	 */
	@ResponseBody
	@RequestMapping(value = "/replyDelete", method = RequestMethod.POST)
	public int replyDelete(int reply_num, String writer, HttpSession session) {
		int result = 0;
		String loginId = (String) session.getAttribute("m_id");
		if (loginId.equals(writer)) {
			result = replyRepository.replyDelete(reply_num);
		}
		return result;
	}

	/**
	 * [현택] 댓글 수정
	 * 
	 * @param session
	 * @param Reply(reply_num,
	 *            writer, reply내용)
	 */
	@ResponseBody
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.POST)
	public int replyUpdate(int reply_num_update, String writer, String updateReply, HttpSession session) {
		int result = 0;
		String loginId = (String) session.getAttribute("m_id");
		if (loginId.equals(writer)) {
			Reply reply = new Reply();
			reply.setM_id(loginId);
			reply.setReply(updateReply);
			reply.setReply_num(reply_num_update);
			result = replyRepository.replyUpdate(reply);
		}
		return result;
	}
}
