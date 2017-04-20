package global.scit.bizcard.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Note {
	
	/*@JsonFormat (shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")*/
	
	private int cardnum;
	private String inputdate;
	private String startdate;
	private String enddate;
	private String note;
	
	public Note() {
	}


	public Note(String inputdate, String startdate, String enddate) {
		this.inputdate = inputdate;
		this.startdate = startdate;
		this.enddate = enddate;
	}


	public Note(int cardnum, String startdate, String enddate, String inputdate, String note, String m_id) {
		this.cardnum = cardnum;
		this.startdate = startdate;
		this.enddate = enddate;
		this.inputdate = inputdate;
		this.note = note;
		this.m_id = m_id;
	}


	private String m_id;
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


	public String getStartdate() {
		return startdate;
	}


	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}


	public String getEnddate() {
		return enddate;
	}


	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}


	public String getInputdate() {
		return inputdate;
	}


	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}


	public String getNote() {
		return note;
	}


	public void setNote(String note) {
		this.note = note;
	}


	@Override
	public String toString() {
		return "Note [cardnum=" + cardnum + ", startdate=" + startdate + ", enddate=" + enddate + ", inputdate="
				+ inputdate + ", note=" + note + ", m_id=" + m_id + "]";
	}


	
}
