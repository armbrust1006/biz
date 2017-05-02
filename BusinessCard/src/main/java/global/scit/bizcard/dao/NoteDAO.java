package global.scit.bizcard.dao;

import java.util.List;

import global.scit.bizcard.vo.CardImage;
import global.scit.bizcard.vo.Note;

public interface NoteDAO {
	public List<Note> noteList (String m_id) throws Exception;
	public int addNote(Note note) throws Exception;
	public int addYourNote(Note note) throws Exception;
	public int deleteNote(Note note) throws Exception;
	public int deleteYourNote(int cardnum) throws Exception;
	
}
