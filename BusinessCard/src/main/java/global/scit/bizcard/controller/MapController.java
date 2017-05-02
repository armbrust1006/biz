package global.scit.bizcard.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import global.scit.bizcard.repository.CardRepository;
import global.scit.bizcard.vo.Card;

@Controller
public class MapController {

	@Autowired
	private CardRepository cardRepository;

	/**
	 * [현택] 길찾기
	 */
	@RequestMapping(value = "/searchRoute", method = RequestMethod.GET)
	public String route(String start, String end, Model model) {
		System.out.println(start);
		System.out.println(end);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		return "possCards/route";
	}

	/**
	 * 길찾기에서 경유지 목록 보여주기
	 * 
	 * @param session
	 * @param sort
	 * @return
	 */
	@RequestMapping(value = "/addStop", method = RequestMethod.GET)
	public String addStop(HttpSession session, Model model) {
		System.out.println("경유지 호출");
		String m_id = (String) session.getAttribute("m_id");
		if (m_id != null) {
			List<Card> stopList = (ArrayList<Card>) cardRepository.addStop(m_id);
			model.addAttribute("stopList", stopList);
			return "possCards/routeStopBy";
		}
		return null;
	}

	/**
	 * 지도 다중 경로
	 * 
	 * @param session
	 * @param sort
	 * @param model
	 * @return
	 */
	/*
	 * @RequestMapping(value = "/routeStopBy", method = RequestMethod.GET)
	 * public String routeStopBy(HttpSession session, String sort, Model model)
	 * { ArrayList<Card> list = new ArrayList<>(); sort = "date"; String m_id =
	 * (String) session.getAttribute("m_id"); if (m_id != null) { Map<String,
	 * Object> sortMap = new HashMap<>(); sortMap.put("m_id", m_id);
	 * sortMap.put("sort", sort); list = (ArrayList<Card>)
	 * cardRepository.myCardListData(sortMap); model.addAttribute("stopBy",
	 * list); System.out.println(list.toString() + "경유지싹다"); } return
	 * "possCards/routeStopBy"; }
	 */

}
