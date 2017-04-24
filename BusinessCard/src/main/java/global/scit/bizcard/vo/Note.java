package global.scit.bizcard.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Note {
	
	/*@JsonFormat (shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")*/
	
	private String m_id;
	private int cardnum;
	private String inputdate;
	private String start;
	private String end;
	private String title;
	private String color;
	
	public Note() {
	}

	
	
	public Note(String m_id, int cardnum, String inputdate, String start, String end, String title, String color) {
		super();
		this.m_id = m_id;
		this.cardnum = cardnum;
		this.inputdate = inputdate;
		this.start = start;
		this.end = end;
		this.title = title;
		this.color = color;
	}



	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getCardnum() {
		return cardnum;
	}

	public void setCardnum(int cardnum) {
		this.cardnum = cardnum;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}


	public String getColor() {
		return color;
	}


	public void setColor(String color) {
		this.color = color;
	}



	@Override
	public String toString() {
		return "Note [m_id=" + m_id + ", cardnum=" + cardnum + ", inputdate=" + inputdate + ", start=" + start
				+ ", end=" + end + ", title=" + title + ", color=" + color + "]";
	}


	
	
}
