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
	 * 내 일정 입력
	 */
	@ResponseBody
	@RequestMapping (value="addNote", method=RequestMethod.POST)
	public int addNote (Note note, Model model) {
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
			System.out.println(result);
		return result;
	}
	
	/**
	 * 타인관련 일정 입력
	 */
	@ResponseBody
	@RequestMapping (value="addYourNote", method=RequestMethod.POST)
	public int addYourNote (Note note, Model model) {
		Note newNote = new Note();
		int result = 0;
		
			newNote.setM_id(note.getM_id());
			newNote.setCardnum(note.getCardnum());
			newNote.setStartDate(note.getStartDate());
			newNote.setEndDate(note.getEndDate());
			newNote.setTitle(note.getTitle());
			newNote.setContent(note.getContent());
			newNote.setChk(note.getChk());
					
			System.out.println("보내기전 확인 네것===>" + newNote.toString());
			result = noteRPS.addYourNote(newNote);
			System.out.println(result);
		return result;
	}

	
	/**
	 * 
	 * @param session
	 * @param note
	 * @param model
	 * @return
	 * 캘린더에 입력된 타인 명함관련 메모 클릭시 보여줄 타인 명함 정보
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
	
	
	/*캘린더 입력된 메모 삭제*/
	@ResponseBody
	@RequestMapping (value="delCardNote", method=RequestMethod.POST)
	public int delCardNote(Note note) {
		int result=0;
		result = noteRPS.deleteNote(note);
		return result;
	}
}
