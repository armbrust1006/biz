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
import global.scit.bizcard.vo.Card;
import global.scit.bizcard.vo.CardImage;

@Controller
public class MyController {
	private static final Logger logger = LoggerFactory.getLogger(MyController.class);

	@Autowired
	private CardRepository cardRepository;
	@Autowired
	private CardImageRepository cardImageRepository;

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
}
