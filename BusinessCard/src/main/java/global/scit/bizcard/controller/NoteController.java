package global.scit.bizcard.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.scit.bizcard.repository.CardRepository;
import global.scit.bizcard.repository.NoteRepository;
import global.scit.bizcard.vo.Card;
import global.scit.bizcard.vo.Note;

@Controller
public class NoteController {
	@Autowired
	NoteRepository noteRPS;
	@Autowired
	CardRepository cardRepository;
	
	
	private static final Logger logger = LoggerFactory.getLogger(NoteController.class);
	
	
	@RequestMapping (value="/mySchedule", method=RequestMethod.GET)
	public String mySchedule() {
		return "myPage/mySchedule";
	}
	
	
	@ResponseBody
	@RequestMapping (value="noteList", method=RequestMethod.GET)
	public List<Note> noteList(String m_id) {
		List<Note> noteList = noteRPS.noteList(m_id);
		return noteList;
	}
	
	
	/**
	 * @param start 변환할 시작 날짜
	   @param end 변환할 종료 날짜
	 * @param fromFormatString 변환될 포맷
	 * @param toFormatString 변환할 포맷
	 * @return 변환된 날짜 문자열
	 */
	@ResponseBody
	@RequestMapping (value="addNote", method=RequestMethod.POST)
	public int formattedDate (Note note, Model model) {
		Note newNote = new Note();
		int result = 0;
		
			newNote.setM_id(note.getM_id());
			newNote.setCardnum(note.getCardnum());
			newNote.setStartDate(note.getStartDate());
			newNote.setEndDate(note.getEndDate());
			newNote.setTitle(note.getTitle());
			newNote.setContent(note.getContent());
			newNote.setChk(note.getChk());
					
			System.out.println("보내기전 확인" + newNote.toString());
			result = noteRPS.addNote(newNote);
		return result;
	}
	
	/**
	 * 
	 * 날짜를 원하는 형태의 문자열로 반환합니다.
	 * 
	 * @param date 변환할 Date 인스턴스
	 * @param format 변환할 포맷
	 * @return 변환된 날짜 문자열
	 *//*
	public static String formattedDate(Date date, String format)
	{
		SimpleDateFormat toFormat = new SimpleDateFormat(format);
		return toFormat.format(date);
	}
	 */
	@ResponseBody
	@RequestMapping (value="getCard", method=RequestMethod.POST)
	public Card popupDetail(HttpSession session, Note note, Model model) {
		Card card = new Card();
		card.setCardNum(note.getCardnum());
		card.setM_id(String.valueOf(session.getAttribute("m_id")));
		logger.info("card:" + card.toString());
		Card yourCard = cardRepository.selectOneCard(card);
		logger.info("my:" + yourCard.toString());
/*		model.addAttribute("yourCard", yourCard);*/
		return yourCard;
	}
	
	@ResponseBody
	@RequestMapping (value="delCardNote", method=RequestMethod.POST)
	public int delCardNote(Note note) {
		int result=0;
		result = noteRPS.deleteNote(note);
		return result;
	}
}
