package global.scit.bizcard.dao;

import java.util.List;

import global.scit.bizcard.vo.CardImage;
import global.scit.bizcard.vo.Note;

public interface NoteDAO {

	public List<Note> noteList (String m_id) throws Exception;
	public int addNote(Note note) throws Exception;
	public String getCard(Note note) throws Exception;
}
