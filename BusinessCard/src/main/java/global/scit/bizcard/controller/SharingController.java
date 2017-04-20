package global.scit.bizcard.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.scit.bizcard.repository.SharingRepository;
import global.scit.bizcard.vo.CardBooks;
import global.scit.bizcard.vo.Member;
import global.scit.bizcard.vo.Message;

@Controller
public class SharingController {

	@Autowired
	SharingRepository sRPS;
	// 멤버 선언
	List<HashMap<String, Object>> roomList; // 공유방 하나에 대한 정보가 담김
	int book_num; // 공유방 하나 클릭했을 때 그 방의 번호
	String targetId; // 초대장 받는 아이디

	// 1. 공유방 목록보기
	@RequestMapping(value = "/sharingRoom", method = RequestMethod.GET)
	public String sharedCardsList(Model model, HttpSession session) {
		String m_id = (String) session.getAttribute("m_id");
		ArrayList<CardBooks> cList = sRPS.listCardBooks(m_id);
		model.addAttribute("CardBooks", cList);
		return "sharingCards/sharingRoom";
	}

	// 2. 공유방 만들기
	@RequestMapping(value = "/makeRoom", method = RequestMethod.POST)
	public String makeRoom(HttpSession session, CardBooks card) {
		String m_id = (String) session.getAttribute("m_id");
		card.setM_id(m_id);
		card.setGrade("manager");
		sRPS.makeRoom(card);
		return "redirect:/sharingRoom";
	}

	// 3. 공유방 하나 클릭
	@RequestMapping(value = "/selectOneRoom", method = RequestMethod.GET)
	public String selectOneRoom(int book_num, Model model) {
		this.book_num = book_num;
		this.roomList = sRPS.selectOneRoom(book_num);
		model.addAttribute("book_num", book_num);
		model.addAttribute("roomList", roomList);
		return "sharingCards/selectOneRoom";
	}

	// 초대할 목록 보여주기
	@ResponseBody
	@RequestMapping(value = "/inviteList", method = RequestMethod.GET)
	public ArrayList<Member> inviteList(HttpSession session, Model model,
			@RequestParam(value = "searchTitle", defaultValue = "") String searchTitle,
			@RequestParam(value = "searchText", defaultValue = "") String searchText) {
		ArrayList<Member> iList = sRPS.inviteList(searchTitle, searchText);
		for (int i = 0; i < iList.size(); i++) {
			if (iList.get(i).getM_id().equals(session.getAttribute("m_id"))) {
				iList.remove(i);
			}
		}
		model.addAttribute("searchTitle", searchTitle);
		model.addAttribute("searchTitle", searchText);
		model.addAttribute("iList", iList);

		return iList;
	}

	// 초대장 폼
	@RequestMapping(value = "/invitationCard", method = RequestMethod.GET)
	public String invitationCard(String targetId, Model model) {
		this.targetId = targetId;
		return "sharingCards/invitationCard";
	}

	// 초대장 보내기
	@RequestMapping(value = "/invite", method = RequestMethod.POST)
	public String invite(Message message, HttpSession session) {
		String m_id = (String) session.getAttribute("m_id");
		message.setSender(m_id); // 메시지 보내는 사람 set
		message.setTargetId(targetId); // 메시지 받는 사람 set
		message.setType("invitation"); // 메시지 타입을 초대장으로 set
		message.setBook_num(book_num); // 방 번호 set 하기
		sRPS.invite(message);
		return null;
	}

	// 공유방 구성원 보기
	@ResponseBody
	@RequestMapping(value = "/allMember", method = RequestMethod.GET)
	public List<HashMap<String, Object>> allMember(Model model) {
		return roomList;
	}

	/*
	 * 아래 부터는 쪽지 기능 * * * * * * * * * * * * * *
	 */
	@RequestMapping(value = "/messageList", method = RequestMethod.GET)
	public String selectOneRoom(HttpSession session, Model model) {
		ArrayList<Message> inbox = new ArrayList<>();
		String m_id = (String) session.getAttribute("m_id");
		ArrayList<Message> messageList = sRPS.messageList(m_id);
		for (Message message : messageList) {
			if (message.getTargetId().equals(m_id)) {
				inbox.add(message);
				model.addAttribute("inbox", inbox);
			}
		}
		return "sharingCards/messageList";
	}

	// 수신함(inbox) 요청
	@ResponseBody
	@RequestMapping(value = "/inBoxList", method = RequestMethod.GET)
	public ArrayList<Message> inBoxList(HttpSession session, Model model) {
		ArrayList<Message> inbox = new ArrayList<>();
		String m_id = (String) session.getAttribute("m_id");
		ArrayList<Message> messageList = sRPS.messageList(m_id);
		for (Message message : messageList) {
			if (message.getTargetId().equals(m_id)) {
				inbox.add(message);
			}
		}
		return inbox;
	}

	// 발신함(outbox) 요청
	@ResponseBody
	@RequestMapping(value = "/outBoxList", method = RequestMethod.GET)
	public ArrayList<Message> outBoxList(HttpSession session) {
		ArrayList<Message> outbox = new ArrayList<>();
		String m_id = (String) session.getAttribute("m_id");
		ArrayList<Message> messageList = sRPS.messageList(m_id);
		for (Message message : messageList) {
			if (message.getSender().equals(m_id)) {
				outbox.add(message);
			}
		}
		return outbox;
	}

	// 메시지 보내기
	@RequestMapping(value = "/writeMessage", method = RequestMethod.POST)
	public String writeMessage(Message message, HttpSession session) {
		String m_id = (String) session.getAttribute("m_id");
		message.setSender(m_id);
		message.setType("message");
		message.setBook_num(0000); // 일반 메시지의 경우 0000을 임의로 set한다.
		sRPS.writeMessage(message);
		return "redirect:/messageList";
	}

	// 메시지 하나 클릭 시
	@RequestMapping(value = "/invitedCard", method = RequestMethod.GET)
	public String invitedCard(@RequestParam(value = "book_num", defaultValue = "0") int book_num,
			@RequestParam(value = "sender") String sender, @RequestParam(value = "message") String message,
			@RequestParam(value = "date") String date, Model model) {
		model.addAttribute("m_book_num", book_num);
		model.addAttribute("m_sender", sender);
		model.addAttribute("m_message", message);
		model.addAttribute("m_date", date);
		Message m = new Message();
		m.setSenddate(date);
		m.setBook_num(book_num);
		m.setSender(sender);
		m.setMessage(message);
		sRPS.readMessage(m);
		return "sharingCards/invitedCard";
	}

	@RequestMapping(value = "/joinRoom", method = RequestMethod.POST)
	public String joinRoom(int book_num, HttpSession session) {
		String m_id = (String) session.getAttribute("m_id");
		CardBooks card = new CardBooks();
		card.setBook_num(book_num);
		card.setM_id(m_id);
		card.setGrade("member");
		System.out.println(card.toString() + "초대수락");
		sRPS.joinRoom(card);

		return null;
	}

	// 테스트
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		return "sharingCards/test";
	}

}
