package global.scit.bizcard.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.scit.bizcard.repository.CardImageRepository;
import global.scit.bizcard.repository.CardRepository;
import global.scit.bizcard.repository.MemberRepository;
import global.scit.bizcard.vo.Card;
import global.scit.bizcard.vo.CardImage;
import global.scit.bizcard.vo.Member;

@Controller
public class MyController {
	private static final Logger logger = LoggerFactory.getLogger(MyController.class);

	@Autowired
	private CardRepository cardRepository;
	@Autowired
	private CardImageRepository cardImageRepository;
	@Autowired
	private MemberRepository mRPS;

	

	/**
	 * MyPage -> 내 명함 페이지
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/myCard", method = RequestMethod.GET)
	public String selectMyCard(HttpSession session, Model model) {
		Card card = new Card();
		card.setM_id(String.valueOf(session.getAttribute("m_id")));
		Card myCard = cardRepository.selectOneCard(card);
		if (myCard != null) {
			model.addAttribute("myCard", myCard);
			return "home/home_myHome";
		} else {
			model.addAttribute("error", "내 명함 없음");
			return "myPage/myCard";
		}
	}

	/**
	 * MyPage -> 내 명함 페이지
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/myCard", method = RequestMethod.POST)
	public String myCardShared(CardImage cardImage, HttpSession session, Model model) {
		logger.info("cardImage:" + cardImage.toString());
		if (cardImageRepository.sharedChange(cardImage) != 0) {
			Card card = new Card();
			card.setM_id(String.valueOf(session.getAttribute("m_id")));
			Card myCard = cardRepository.selectOneCard(card);
			model.addAttribute("myCard", myCard);
			logger.info("myCard:" + myCard.toString());
		}
		return "myPage/myCard";
	}
	
	@RequestMapping(value="/myPage", method=RequestMethod.GET)
	public String update(HttpSession session, Model model){
		String id = (String)session.getAttribute("m_id");
		Member updateM = mRPS.idCheck(id);
		
		logger.debug("고객님 명단 : {} ",updateM);
		model.addAttribute("member",updateM);
		
		return "myPage/myPage";
	}
	
	
	//개인정보수정 
	@RequestMapping(value="/updateM", method = RequestMethod.POST)
	public String update(Member member, Model model, HttpSession session)
	{
		int result = 0;
		try {
			result = mRPS.updateM(member);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result == 0) {
			
			return "myPage/myPage";
		}
		else if(result == 1){

		return "myPage/myPage";
		}
		return "myPage/myPage";
	}
	
	
	
	
	
}

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.scit.bizcard.repository.CardImageRepository;
import global.scit.bizcard.repository.CardRepository;
import global.scit.bizcard.vo.Card;
import global.scit.bizcard.vo.CardImage;

@Controller
public class MyController {
	private static final Logger logger = LoggerFactory.getLogger(MyController.class);

	@Autowired
	private CardRepository cardRepository;
	@Autowired
	private CardImageRepository cardImageRepository;

	@RequestMapping(value = "/selectCardType", method = RequestMethod.GET)
	public String myCard(HttpSession session, Model model) {
		if (cardImageRepository.myCardExist(String.valueOf(session.getAttribute("m_id"))) != null) {
			model.addAttribute("error", "이미 명함을 갖고 계십니다.");
		}
		return "myPage/selectCardType";
	}

	@RequestMapping(value = "/registerMyCard", method = RequestMethod.GET)
	public String registerMyCard(int type) {
		if (type == 0) {
			return "myPage/DragAndDrop";
		} else if (type == 1) {
			return "myPage/OCRPage";
		} else {
			return "myPage/registerMyCard";
		}
	}

	/**
	 * 타인명함등록 카드 유형 선택페이지 이동
	 * 
	 * @return
	 */
	@RequestMapping(value = "/selectOthersCardTypes", method = RequestMethod.GET)
	public String registerOthersCard() {
		return "possCards/selectOthersCardTypes";
	}

	/**
	 * 타인명함카드 입력 페이지 이동
	 * 
	 * @return
	 */
	@RequestMapping(value = "/registerOthersCard", method = RequestMethod.GET)
	public String registerOthersCard(int type) {
		if (type == 0) {
			return "possCards/othersDragAndDrop";
		} else if (type == 1) {
			return "possCards/othersOCRPage";
		} else {
			return "possCards/registerOthersCard";
		}
	}

	@RequestMapping(value = "/registerPoss", method = RequestMethod.GET)
	public String registerPoss() {
		return "possCards/registerPossCard";
	}

	/* 개인 정보 수정 페이지로 이동. - 개인 명함 정보 수정이 아님. */
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myDetail() {
		return "myPage/myPage";
	}

	/**
	 * MyPage -> 내 명함 페이지
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/myCard", method = RequestMethod.GET)
	public String selectMyCard(HttpSession session, Model model) {
		Card card = new Card();
		card.setM_id(String.valueOf(session.getAttribute("m_id")));
		logger.info("card:" + card.toString());
		Card myCard = cardRepository.selectOneCard(card);
		logger.info("my:" + myCard.toString());
		if (myCard != null) {
			model.addAttribute("myCard", myCard);
		} else {
			model.addAttribute("error", "내 명함 없음");
		}
		return "myPage/myCard";
	}

	/**
	 * MyPage -> 내 명함 페이지
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/myCard", method = RequestMethod.POST)
	public String myCardShared(CardImage cardImage, HttpSession session, Model model) {
		logger.info("cardImage:" + cardImage.toString());
		if (cardImageRepository.sharedChange(cardImage) != 0) {
			Card card = new Card();
			card.setM_id(String.valueOf(session.getAttribute("m_id")));
			Card myCard = cardRepository.selectOneCard(card);
			model.addAttribute("myCard", myCard);
			logger.info("myCard:" + myCard.toString());
		}
		return "myPage/myCard";
	}
}

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.scit.bizcard.repository.CardImageRepository;
import global.scit.bizcard.repository.CardRepository;
import global.scit.bizcard.repository.MemberRepository;
import global.scit.bizcard.vo.Card;
import global.scit.bizcard.vo.CardImage;
import global.scit.bizcard.vo.Member;

@Controller
public class MyController {
	private static final Logger logger = LoggerFactory.getLogger(MyController.class);

	@Autowired
	private CardRepository cardRepository;
	@Autowired
	private CardImageRepository cardImageRepository;
	@Autowired
	private MemberRepository mRPS;

	

	/**
	 * MyPage -> 내 명함 페이지
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/myCard", method = RequestMethod.GET)
	public String selectMyCard(HttpSession session, Model model) {
		Card card = new Card();
		card.setM_id(String.valueOf(session.getAttribute("m_id")));
		logger.info("card:" + card.toString());
		Card myCard = cardRepository.selectOneCard(card);
		if (myCard == null) {
			model.addAttribute("error", "명함이 생성되어 있지 않아 명함 생성 페이지로 이동합니다!");
		} else {
			model.addAttribute("myCard", myCard);
		}
		return "myPage/myCard";
	}

	/**
	 * MyPage -> 내 명함 페이지
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/myCard", method = RequestMethod.POST)
	public String myCardShared(CardImage cardImage, HttpSession session, Model model) {
		logger.info("cardImage:" + cardImage.toString());
		if (cardImageRepository.sharedChange(cardImage) != 0) {
			Card card = new Card();
			card.setM_id(String.valueOf(session.getAttribute("m_id")));
			Card myCard = cardRepository.selectOneCard(card);
			model.addAttribute("myCard", myCard);
			logger.info("myCard:" + myCard.toString());
		}
		return "myPage/myCard";
	}
	
	@RequestMapping(value="/myPage", method=RequestMethod.GET)
	public String update(HttpSession session, Model model){
		String id = (String)session.getAttribute("m_id");
		Member updateM = mRPS.idCheck(id);
		
		logger.debug("고객님 명단 : {} ",updateM);
		model.addAttribute("member",updateM);
		
		return "myPage/myPage";
	}
	
	
	//개인정보수정 
	@RequestMapping(value="/updateM", method = RequestMethod.POST)
	public String update(Member member, Model model, HttpSession session)
	{
		int result = 0;
		try {
			result = mRPS.updateM(member);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result == 0) {
			
			return "myPage/myPage";
		}
		else if(result == 1){

		return "myPage/myPage";
		}
		return "myPage/myPage";
	}
	
	
	
	
	
}
