package global.scit.bizcard.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.scit.bizcard.repository.CardImageRepository;
import global.scit.bizcard.repository.MemberRepository;
import global.scit.bizcard.vo.Member;

@Controller
public class HomeController {

	@Autowired
	MemberRepository MemberRepository;
	@Autowired
	CardImageRepository CardImageRepository;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/about-us", method = RequestMethod.GET)
	public String about(HttpSession session) {
		String id = (String) session.getAttribute("m_id");
		if (id != null) {
			return "about-us-user";
		}
		return "about-us";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "myPage/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Member member, HttpSession session, Model model) {
		Member selectM = MemberRepository.selectM(member);
		if (selectM != null) {
			session.setAttribute("m_id", member.getM_id());
			return "login_home";
		} else {
			model.addAttribute("errorMSG", "登録された会員情報がございません。<br> 入力したID・パスワードを確認してください。");
			return "myPage/login";
		}
	}

	@RequestMapping(value = "/login_home", method = RequestMethod.GET)
	public String index_home(HttpSession session) {
		String id = (String) session.getAttribute("m_id");
		if (id != null) {
			return "login_home";
		} else {
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register() {
		return "myPage/registerMember_fin";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String regist(Member member) {
		MemberRepository.insertM(member);
		return "redirect:/";
	}

	@ResponseBody
	@RequestMapping(value = "/emailchecksss", method = RequestMethod.POST)
	public String emailcheck(String email, Model model) {
		Member result = MemberRepository.emailCheck(email);
		System.out.println("result" + result);
		System.out.println("email" + email);
		String re = "0";
		if (result != null) {
			return "1";
		} else if (result == null) {
			return "0";
		}
		return re;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faq() {
		return "faq";
	}

	/**
	 * 로그인 후 페이지 구분을 위해 명함여부 확인
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	public String idcheck(String id, Model model) {
		Member result = MemberRepository.idCheck(id);
		String re = "0";
		if (result != null) {
			return "1";
		} else if (result == null) {
			return "0";
		}
		return re;
	}

	/**
	 * 내 명함 상세 페이지 이동
	 * 
	 * @return
	 */
	@RequestMapping(value = "/manageMyCard", method = RequestMethod.GET)
	public String detailCard() {
		return "possCards/manageMyCard";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "index";
	}

}
