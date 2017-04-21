package global.scit.bizcard.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		logger.info(m_id+"");
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
		SimpleDateFormat fromFormat = new SimpleDateFormat("EEEE dd MMMMM yyyy");
		SimpleDateFormat toFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date fromDate = null;
		Date toDate = null;
		String sDate = "";
		String eDate = "";
		Note newNote = new Note();
		int result = 0;
		try
		{
			fromDate = fromFormat.parse(note.getStart());
			toDate = fromFormat.parse(note.getEnd());
			sDate = toFormat.format(fromDate);
			eDate = toFormat.format(toDate);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
			newNote.setM_id(note.getM_id());
			newNote.setStart(sDate);
			newNote.setEnd(eDate);
			newNote.setTitle(note.getTitle());
			System.out.println(newNote.toString()+"toString출력");
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
	
	@RequestMapping (value="getCard", method=RequestMethod.POST)
	public String popupDetail(int card, String date) {
		
		return "";
	}
}
