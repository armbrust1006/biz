package global.scit.bizcard.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import global.scit.bizcard.repository.CardImageRepository;
import global.scit.bizcard.repository.CardRepository;
import global.scit.bizcard.repository.MemberRepository;
import global.scit.bizcard.util.FileService;
import global.scit.bizcard.util.ImageService;
import global.scit.bizcard.util.Tess4J;
import global.scit.bizcard.vo.Card;
import global.scit.bizcard.vo.CardImage;
import global.scit.bizcard.vo.OCRData;
import global.scit.bizcard.vo.OCRResultData;

@Controller
public class AccessCardController {

	private static final Logger logger = LoggerFactory.getLogger(AccessCardController.class);

	@Autowired
	private CardRepository cardRepository;
	@Autowired
	private CardImageRepository cardImageRepository;
	@Autowired
	private MemberRepository memberRepository;
	@Autowired
	private ServletContext servletContext;

	final String uploadPathLogo = "/CardImageFile/logo";
	final String uploadPathCard = "/CardImageFile/card";
	final String uploadPathOCR = "/CardImageFile/OCR";
	final String getPathOCR = "C:\\CardImageFile\\OCR\\";

	/**
	 * Select business card type for create
	 * 
	 * @param session
	 *            Get login id
	 * @param type
	 *            Get cart type
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/selectCardType", method = RequestMethod.GET)
	public String myCard(HttpSession session, @RequestParam(value = "type", defaultValue = "others") String type,
			Model model) {
		if (type.equalsIgnoreCase("my")) {
			if (cardImageRepository.myCardExist(String.valueOf(session.getAttribute("m_id"))) != null) {
				model.addAttribute("error", "You already have a business card.");
			} else {
				session.setAttribute("cardType", "my");
			}
		} else {
			session.setAttribute("cardType", "others");
		}
		return "registerCard/selectCardType";
	}

	/**
	 * Select Card Layout
	 * 
	 * @param session
	 *            Get login id
	 * @param layout_num
	 *            Get select layout type
	 * @param model
	 *            Return select layout type
	 * @return Change page to layout types
	 */
	@RequestMapping(value = "/selectCardLayout", method = RequestMethod.GET)
	public String registerMyCard(HttpSession session, int layout_num, Model model) {
		if (session.getAttribute("cardType") == null) {
			return "login_home";
		}
		model.addAttribute("cardType", session.getAttribute("cardType"));
		model.addAttribute("layout_num", layout_num);
		session.removeAttribute("cardType");
		if (layout_num == 0) {
			return "registerCard/OCRPage";
		} else if (layout_num == 1) {
			return "registerCard/DragAndDrop";
		} else {
			return "registerCard/CardLayout";
		}
	}

	/**
	 * Create business card image and Saving
	 * 
	 * @param imageBase64
	 *            Canvas array list data of changing to image file
	 * @param cardImage
	 *            Set Card data VO
	 * @return Saving result return
	 */
	@RequestMapping(value = "/saveCanvasImage", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> imageSave(
			@RequestParam(value = "imageBase64", defaultValue = "") String imageBase64, CardImage cardImage) {
		// 이미지 정상 저장 확인을 위한 맵
		Map<String, Object> res = new HashMap<String, Object>();
		if (!imageBase64.isEmpty()) {
			String imageName = ImageService.saveImage(imageBase64, cardImage.getM_id(), uploadPathCard);
			cardImage.setImagePath(imageName);
			cardImageRepository.saveCardImage(cardImage);
			res.put("ret", 0);
		} else {
			res.put("ret", -1);
		}
		return res;
	}

	/**
	 * Create business card and saving
	 * 
	 * @param card
	 *            Set card data
	 * @param logo
	 *            Get logo image
	 * @param session
	 *            Get login id
	 * @return Save my card and move to my page OR Save others card and move to
	 *         my card list page
	 */
	@RequestMapping(value = "/saveCardData", method = RequestMethod.POST)
	public String saveCard(Card card, MultipartFile logo, HttpSession session) {
		String m_id = String.valueOf(card.getM_id());
		int cardnum = cardImageRepository.getImageNumber(m_id);
		card.setCardNum(cardnum);

		if (!logo.isEmpty()) {
			card.setImgOriginal(logo.getOriginalFilename());
			String savedFile = FileService.saveFile(logo, uploadPathLogo);
			card.setLogoImg(savedFile);
		} else {
			card.setLogoImg("");
			card.setImgOriginal("");
		}
		cardRepository.insertCard(card);

		String type = card.getCardType();
		if (type.equalsIgnoreCase("my")) {
			return "redirect:/myCard";
		} else {
			CardImage cardImage = new CardImage();
			cardImage.setM_id(m_id);
			cardImage.setCardNum(cardnum);
			cardImageRepository.setMyCardList(cardImage);
			return "possCards/myPossCardList";
		}
	}

	/**
	 * OCR scan image
	 * 
	 * @param language
	 * @param file
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/imageScan", method = RequestMethod.POST)
	public String ocrScan(OCRData ocrData, MultipartFile file, Model model, HttpServletRequest request) {
		String savedFile = FileService.saveFile(file, uploadPathOCR);
		String savedPath = FileService.saveFile(file, uploadPathCard);
		ocrData.setImagePath(savedFile);
		Tess4J tess4j = new Tess4J();
		OCRResultData result = tess4j.getTess4J(ocrData, request);

		Card card = new Card();
		card.setImagePath(ocrData.getImagePath());
		card.setCardType(ocrData.getCardType());
		card.setLayout_num(ocrData.getLayout_num());
		card.setLanguage(ocrData.getLanguage());
		card.setImgOriginal(savedPath);

		model.addAttribute("OCRResultData", result);
		model.addAttribute("card", card);
		System.out.println(card.toString());

		return "registerCard/OCRResult";
	}

	/**
	 * Save OCR scan image and data
	 * 
	 * @param language
	 * @param file
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/ocrImageDataSave", method = RequestMethod.POST)
	public String ocrSave(Card card) {
		System.out.println("card:" + card.getImagePath());
		new File(getPathOCR + card.getImagePath() + ".png").delete();

		cardImageRepository.saveCardImage(card);

		int cardnum = cardImageRepository.getImageNumber(card.getM_id());
		card.setCardNum(cardnum);
		card.setLogoImg("");
		card.setImgOriginal("");
		String language = card.getLanguage();
		if (language.equals("eng+kor")) {
			card.setLanguage("kor");
		} else if (language.equals("eng+jpn")) {
			card.setLanguage("jpn");
		}
		cardRepository.insertCard(card);

		String type = card.getCardType();
		if (type.equalsIgnoreCase("my")) {
			return "redirect:/myCard";
		} else {
			CardImage cardImage = new CardImage();
			cardImage.setM_id(card.getM_id());
			cardImage.setCardNum(cardnum);
			cardImageRepository.setMyCardList(cardImage);
			return "possCards/myPossCardList";
		}
	}

	/**
	 * Get business List
	 * 
	 * @param session
	 * @param sort
	 * @param model
	 * @return CardList Page move
	 */
	@RequestMapping(value = "/myCardList", method = RequestMethod.GET)
	public String myCardList() {
		return "possCards/myPossCardList";
	}

	/**
	 * Cards searching
	 * 
	 * @param select
	 * @param search
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/searchCard", method = RequestMethod.GET)
	public String cardSearchs(String select, String search, HttpSession session, Model model) {
		Map<String, Object> searchMap = new HashMap<>();
		ArrayList<Card> list = new ArrayList<>();
		if (select != null || search != null) {
			searchMap.put("select", select);
			searchMap.put("search", search);
		}
		String m_id = String.valueOf(session.getAttribute("m_id"));
		searchMap.put("m_id", m_id);
		list = (ArrayList<Card>) cardRepository.searchCards(searchMap);
		model.addAttribute("list", list);
		return "possCards/cardSearch";
	}

	/**
	 * Select one after searching card
	 * 
	 * @param select
	 * @param search
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/searchCardSelect", method = RequestMethod.GET)
	public String searchCardSelect(int cardnum, Model model) {
		model.addAttribute("selectedCard", cardRepository.searchCardSelect(cardnum));
		model.addAttribute("searchCard", "searchCard");
		return "possCards/selectOneCard";
	}

	/**
	 * Add selected cards to my list
	 * 
	 * @param session
	 * @param cardNum
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/searchCardAdd", method = RequestMethod.POST)
	public String searchCardAdd(HttpSession session, int cardNum, Model model) {
		CardImage cardImage = new CardImage();
		cardImage.setM_id(String.valueOf(session.getAttribute("m_id")));
		cardImage.setCardNum(cardNum);
		if (cardImageRepository.myListOverlap(cardImage) == 0) {
			return "redirect:/";
		} else {
			cardImageRepository.setMyCardList(cardImage);
			return "redirect:/";
		}
	}

	/**
	 * Search my business card list
	 * 
	 * @param session
	 *            Get loginID and setting
	 * @param sort
	 *            Set list sort
	 * @return Search list
	 */
	@RequestMapping(value = "/listSort", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Card> myCardListSort(HttpSession session,
			@RequestParam(value = "sort", defaultValue = "date") String sort) {
		String loginID = (String) session.getAttribute("m_id");
		ArrayList<Card> list = new ArrayList<>();
		System.out.println(sort);
		if (loginID != null) {
			Map<String, Object> sortMap = new HashMap<>();
			sortMap.put("m_id", loginID);
			sortMap.put("sort", sort);
			list = (ArrayList<Card>) cardRepository.myCardListData(sortMap);
		}
		return list;
	}

	/**
	 * Only my card can be updated and select
	 * 
	 * @param session
	 * @param cardnum
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/myCardUpdate", method = RequestMethod.POST)
	public String myCardUpdate(HttpSession session, int cardNum, Model model) {
		Card searchCard = new Card();
		searchCard.setM_id(String.valueOf(session.getAttribute("m_id")));
		searchCard.setCardNum(cardNum);

		Card card = cardRepository.selectOneCard(searchCard);
		model.addAttribute("card", card);
		System.out.println("asdasdwadq" + card);
		int layout_num = card.getLayout_num();
		if (layout_num == 1) {
			return "registerCard/updateDragAndDrop";
		} else {
			return "registerCard/updateLayout";
		}
	}

	/**
	 * Only my card image can be updated
	 * 
	 * @param imageBase64
	 * @param cardImage
	 * @return
	 */
	@RequestMapping(value = "/updateCanvasImage", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> updateImage(
			@RequestParam(value = "imageBase64", defaultValue = "") String imageBase64, CardImage cardImage) {
		// 이미지 정상 저장 확인을 위한 맵
		Map<String, Object> res = new HashMap<String, Object>();
		if (!imageBase64.isEmpty()) {
			String imageName = ImageService.saveImage(imageBase64, cardImage.getM_id(), uploadPathCard);
			cardImage.setImagePath(imageName);
			cardImageRepository.updateCardImage(cardImage);
			res.put("ret", 0);
		} else {
			res.put("ret", -1);
		}
		return res;
	}

	/**
	 * Only my card data can be updated
	 * 
	 * @param card
	 * @param logo
	 * @return 보유 카드 목록으로 이동
	 */
	@RequestMapping(value = "/updateCardData", method = RequestMethod.POST)
	public String updateCard(Card card, MultipartFile logo) {
		if (!logo.isEmpty()) {
			card.setImgOriginal(logo.getOriginalFilename());
			String savedFile = FileService.saveFile(logo, uploadPathLogo);
			card.setLogoImg(savedFile);
		} else {
			card.setLogoImg("");
			card.setImgOriginal("");
		}
		cardRepository.updateCard(card);

		return "redirect:/myCard";
	}

	/**
	 * [현택] 타인 명함 삭제
	 * 
	 * @param cardNum
	 * @param session("m_id")
	 * @return 보유 명함 목록으로 이동
	 */
	@RequestMapping(value = "/cardDelete", method = RequestMethod.POST)
	public String cardDelete(CardImage cardImage, HttpSession session) {
		System.out.println("삭제: " + cardImage.toString());
		cardImage.setM_id(String.valueOf(session.getAttribute("m_id")));
		cardImageRepository.deleteCardImage(cardImage);
		if (cardImage.getCardType() == null) {
			return "redirect:login_home";
		} else {
			return "redirect:myCardList";
		}
	}

	/**
	 * Get logo image
	 * 
	 * @param response
	 * @param logoImg
	 * @param imgOriginal
	 * @return
	 */
	@RequestMapping(value = "/downloadlogo", method = RequestMethod.GET)
	public String downloadlogo(HttpServletResponse response, String logoImg, String imgOriginal) {
		System.out.println("logodd:" + logoImg + ", ii:" + imgOriginal);
		if (logoImg == null && imgOriginal == null) {
			return null;
		}
		try {
			response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(imgOriginal, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		String fullpath = uploadPathLogo + "/" + logoImg;

		ServletOutputStream fileOut = null;
		FileInputStream fileIn = null;

		try {
			fileIn = new FileInputStream(fullpath);
			fileOut = response.getOutputStream();

			FileCopyUtils.copy(fileIn, fileOut);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (fileIn != null)
					fileIn.close();
				if (fileOut != null)
					fileOut.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	/**
	 * Get business card image
	 * 
	 * @param response
	 * @param card
	 * @return
	 */
	@RequestMapping(value = "/downloadImage", method = RequestMethod.GET)
	public String downloadImage(HttpServletResponse response, String card) {
		try {
			response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(card, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		String fullpath = uploadPathCard + "/" + card;

		ServletOutputStream fileOut = null;
		FileInputStream fileIn = null;

		try {
			fileIn = new FileInputStream(fullpath);
			fileOut = response.getOutputStream();

			FileCopyUtils.copy(fileIn, fileOut);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (fileIn != null)
					fileIn.close();
				if (fileOut != null)
					fileOut.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return null;
	}

	/**
	 * Get OCR image
	 * 
	 * @param response
	 * @param card
	 * @return
	 */
	@RequestMapping(value = "/downloadOCRImage", method = RequestMethod.GET)
	public String downloadOCRImageAndDelete(HttpServletResponse response, String card) {
		try {
			response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(card, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		logger.info(card);
		String fullpath = uploadPathOCR + "/" + card;

		ServletOutputStream fileOut = null;
		FileInputStream fileIn = null;

		try {
			fileIn = new FileInputStream(fullpath);
			fileOut = response.getOutputStream();

			FileCopyUtils.copy(fileIn, fileOut);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (fileIn != null)
					fileIn.close();
				if (fileOut != null)
					fileOut.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return null;
	}

	/**
	 * [현택] 명함 하나 선택 페이지로 이동
	 * 
	 * @param cardnum
	 * @param session
	 * @param model
	 */
	@RequestMapping(value = "/selectOneCard", method = RequestMethod.GET)
	public String selectOneCard(String email, int cardnum, HttpSession session, Model model) {
		String loginID = (String) session.getAttribute("m_id");

		email = memberRepository.getEmail(loginID);
		model.addAttribute("m_email", email);

		Card c = new Card();
		c.setM_id(loginID);
		c.setCardNum(cardnum);
		Card selectedCard = cardRepository.selectOneCard(c);
		model.addAttribute("selectedCard", selectedCard);

		String myAddress = cardRepository.myAddress(loginID);
		model.addAttribute("myAddress", myAddress);
		return "possCards/selectOneCard";
	}

	/**
	 * [현택] 공유방으로 명함 공유하기
	 * 
	 * @param session
	 * @param cardnum
	 * @param book_num
	 */
	@ResponseBody
	@RequestMapping(value = "/share", method = RequestMethod.GET)
	public int share(HttpSession session, int cardnum, int book_num) {
		System.out.println("공유하 카드번호: " + cardnum);
		System.out.println("공유하 방번호: " + book_num);
		String m_id = (String) session.getAttribute("m_id");
		int check = cardRepository.shareCheck(cardnum, book_num);
		if (check == 0) {
			return cardRepository.share(book_num, cardnum, m_id);
		}
		return 0;
	}

	@RequestMapping(value = "/listen", method = RequestMethod.POST)
	public @ResponseBody String listen(String textToSpeech, String language) {
		File f = null; // 음성을 담을 파일 객체
		String clientId = "ONX92pr4J0ykWfLxefAd";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "oszwvD6MCx";// 애플리케이션 클라이언트 시크릿값";

		try {
			if (language.equals("kor")) {
				language = "mijin";
			} else if (language.equals("eng")) {
				language = "clara";
			} else {
				language = "yuri";
			}
			String text = URLEncoder.encode(textToSpeech, "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/voice/tts.bin";
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);

			String postParams = "speaker=" + language + "&speed=0&text=" + text;
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(postParams);
			wr.flush();
			wr.close();
			int responseCode = con.getResponseCode();
			System.out.println(responseCode);
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				InputStream is = con.getInputStream();
				int read = 0;
				byte[] bytes = new byte[1024];
				f = new File(servletContext.getRealPath("/resources/voice/") + "voice.mp4");
				f.createNewFile();

				System.out.println(f.getAbsolutePath() + "파일경로");
				OutputStream outputStream = new FileOutputStream(f);
				while ((read = is.read(bytes)) != -1) {
					outputStream.write(bytes, 0, read);
				}
				is.close();
				outputStream.close();
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				String inputLine;
				StringBuffer response = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					response.append(inputLine);
				}
				br.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "./resources/voice/voice.mp4";
	}

}
