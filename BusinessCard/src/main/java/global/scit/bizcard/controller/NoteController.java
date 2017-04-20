package global.scit.bizcard.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.scit.bizcard.repository.NoteRepository;
import global.scit.bizcard.vo.Note;

@Controller
public class NoteController {
	@Autowired
	NoteRepository noteRPS;
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
}
