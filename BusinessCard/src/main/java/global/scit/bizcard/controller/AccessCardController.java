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
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletOutputStream;
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

@Controller
public class AccessCardController {

	private static final Logger logger = LoggerFactory.getLogger(AccessCardController.class);

	@Autowired
	private CardRepository cardRepository;
	@Autowired
	private CardImageRepository cardImageRepository;
	@Autowired
	private MemberRepository memberRepository;
	

	final String uploadPathLogo = "/CardImageFile/logo";
	final String uploadPathCard = "/CardImageFile/card";
	final String uploadPathOCR = "/CardImageFile/OCR";
	final String getPathOCR = "C:\\CardImageFile\\OCR\\";

	/**
	 * 카드 생성 타입 결정
	 * 
	 * @param session
	 * @param type
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/selectCardType", method = RequestMethod.GET)
	public String myCard(HttpSession session, @RequestParam(value = "type", defaultValue = "others") String type,
			Model model) {
		if (type.equalsIgnoreCase("my")) {
			if (cardImageRepository.myCardExist(String.valueOf(session.getAttribute("m_id"))) != null) {
				model.addAttribute("error", "이미 명함을 갖고 계십니다.");
			} else {
				session.setAttribute("cardType", "my");
			}
		} else {
			session.setAttribute("cardType", "others");
		}
		return "registerCard/selectCardType";
	}

	/**
	 * 카드 레이아웃 선택
	 * 
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/selectCardLayout", method = RequestMethod.GET)
	public String registerMyCard(HttpSession session, int layout_num, Model model) {
		if (session.getAttribute("cardType") == null) {
			return "home/login_home";
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
	 * 이미지 생성 및 서버에 이미지 저장
	 * 
	 * @param imageBase64
	 * @param cardImage
	 * @return
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
	 * 카드 생성 및 데이터 저장
	 * 
	 * @param card
	 * @param logo
	 * @return 보유 카드 목록으로 이동
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

		session.removeAttribute("type");
		String type = card.getCardType();
		if (type.equalsIgnoreCase("my")) {
			return "home/login_home";
		} else {
			CardImage cardImage = new CardImage();
			cardImage.setM_id(m_id);
			cardImage.setCardNum(cardnum);
			cardImageRepository.setMyCardList(cardImage);
			return "possCards/myPossCardList";
		}
	}

	/**
	 * OCR 이미지 스캔
	 * 
	 * @param language
	 * @param file
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/imageScan", method = RequestMethod.POST)
	public String ocrScan(Card card, MultipartFile file, Model model) {
		if (file != null && card != null) {
			String savedFile = FileService.saveFile(file, uploadPathOCR);
			Tess4J tess4j = new Tess4J();
			String result = tess4j.getTess4J(getPathOCR + savedFile, card.getLanguage());

			/* maching */
			card.setLayout_num(card.getLayout_num());
			card.setImagePath(savedFile);
			model.addAttribute("card", card);
			model.addAttribute("result", result);
		}
		return "registerCard/OCRResult";
	}

	/**
	 * OCR 이미지 스캔
	 * 
	 * @param language
	 * @param file
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/ocrImageSave", method = RequestMethod.POST)
	public String ocrSave(String language, MultipartFile file, Model model) {
		if (!file.isEmpty() && !language.isEmpty()) {
			String savedFile = FileService.saveFile(file, uploadPathOCR);
			Tess4J tess4j = new Tess4J();
			String result = tess4j.getTess4J(getPathOCR + savedFile, language);

			/* maching */

			model.addAttribute("file", savedFile);
			model.addAttribute("result", result);
		}
		return "registerCard/OCRResult";
	}

	/**
	 * 명함 데이터 가져오기
	 * 
	 * @param session
	 * @param sort
	 * @param model
	 * @return 카드 보유 목록
	 */
	@RequestMapping(value = "/myCardList", method = RequestMethod.GET)
	public String myCardList() {
		return "possCards/myPossCardList";
	}

	/**
	 * 카드 검색
	 * 
	 * @param select
	 * @param search
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/searchCard", method = RequestMethod.GET)
	public String cardSearchs(String select, String search, Model model) {
		Map<String, Object> searchMap = new HashMap<>();
		ArrayList<Card> list = new ArrayList<>();
		if (select != null || search != null) {
			searchMap.put("select", select);
			searchMap.put("search", search);
		}
		list = (ArrayList<Card>) cardRepository.searchCards(searchMap);
		model.addAttribute("list", list);
		return "possCards/cardSearch";
	}
   /**
    * 내 보유 명함 리스트 검색 함수
    * 
    * @param session
    * @param sort
    * @return
    *//*
   @RequestMapping(value = "/listSort", method = RequestMethod.POST)
   public @ResponseBody ArrayList<Card> myCardListSort(HttpSession session,
         @RequestParam(value = "sort", defaultValue = "date") String sort) {
      String loginID = (String) session.getAttribute("m_id");
      System.out.println(sort);
      ArrayList<Card> list = new ArrayList<>();
      if (loginID != null) {
         Map<String, Object> sortMap = new HashMap<>();
         sortMap.put("m_id", loginID);
         sortMap.put("sort", sort);
         list = (ArrayList<Card>) cardRepository.myCardListData(sortMap);
      }
      return list;
   }
*/
	/**
	 * 내 보유 명함 리스트 검색 함수
	 * 
	 * @param session
	 * @param sort
	 * @return
	 */
	@RequestMapping(value = "/listSort", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Card> myCardListSort(HttpSession session,
			@RequestParam(value = "sort", defaultValue = "date") String sort) {
		String loginID = (String) session.getAttribute("m_id");
		ArrayList<Card> list = new ArrayList<>();
		if (loginID != null) {
			Map<String, Object> sortMap = new HashMap<>();
			sortMap.put("m_id", loginID);
			sortMap.put("sort", sort);
			list = (ArrayList<Card>) cardRepository.myCardListData(sortMap);
		}
		return list;
	}

	/**
	 * update target data get
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
		return "registerCard/updateLayout";
	}

	/**
	 * 명함 이지미 수정
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
	 * 카드 수정
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
	 * 로고 이미지 가져오기
	 * 
	 * @param response
	 * @param card
	 * @return
	 */
	@RequestMapping(value = "/downloadlogo", method = RequestMethod.GET)
	public String downloadlogo(HttpServletResponse response, Card card) {
		if (card.getLogoImg() == null && card.getImgOriginal() == null) {
			return null;
		}
		try {
			response.setHeader("Content-Disposition",
					"attachment;filename=" + URLEncoder.encode(card.getImgOriginal(), "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		String fullpath = uploadPathLogo + "/" + card.getLogoImg();

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
	 * 명함 이미지 가져오기
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
	 * OCR 명함 이미지 가져오기 및 삭제
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
		System.out.println(selectedCard.toString() + "보자보자");
		model.addAttribute("selectedCard", selectedCard);
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
			return cardRepository.share(m_id, book_num, cardnum);
		}
		return 0;
	}

	/**
	 * TTS(Text To Speech) 기능
	 * 
	 * @param textToSpeech
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/listen", method = RequestMethod.POST)
	public String listen(String textToSpeech) {
		File f = null; // 음성을 담을 파일 객체
		String clientId = "ONX92pr4J0ykWfLxefAd";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "oszwvD6MCx";// 애플리케이션 클라이언트 시크릿값";
		try {
			String text = URLEncoder.encode(textToSpeech, "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/voice/tts.bin";
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			String postParams = "speaker=mijin&speed=0&text=" + text;
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(postParams);
			wr.flush();
			wr.close();
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				InputStream is = con.getInputStream();
				int read = 0;
				byte[] bytes = new byte[1024];
				// 랜덤한 이름으로 mp3 파일 생성
				String tempname = Long.valueOf(new Date().getTime()).toString();
				System.out.println(tempname + "파일이름");
				f = new File(tempname + ".mp4");
				f.createNewFile();
				System.out.println(f.getAbsolutePath() + "파일경로");

				OutputStream outputStream = new FileOutputStream(f);
				while ((read = is.read(bytes)) != -1) {
					outputStream.write(bytes, 0, read);
				}
				is.close();
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				String inputLine;
				StringBuffer response = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					response.append(inputLine);
				}
				br.close();
				System.out.println(response.toString());
			}
		} catch (Exception e) {
			System.out.println(e);

		}
		return f.getAbsolutePath();
	}

	
}