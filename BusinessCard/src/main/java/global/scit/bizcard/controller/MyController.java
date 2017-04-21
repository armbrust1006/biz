package global.scit.bizcard.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyController {
	private static final Logger logger = LoggerFactory.getLogger(MyController.class);

	@RequestMapping(value = "/selectCardType", method = RequestMethod.GET)
	public String myCard() {
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
}
