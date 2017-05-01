package global.scit.bizcard.vo;

public class Note {

	/* @JsonFormat (shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd") */

	private String m_id;
	private int cardnum;
	private String startDate;
	private String endDate;
	private String inputdate;
	private String title;
	private String content;
	private String chk;

	public Note() {
	}

	public Note(String m_id, int cardnum, String startDate, String endDate, String inputdate, String title,
			String content, String chk) {
		super();
		this.m_id = m_id;
		this.cardnum = cardnum;
		this.startDate = startDate;
		this.endDate = endDate;
		this.inputdate = inputdate;
		this.title = title;
		this.content = content;
		this.chk = chk;
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

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getChk() {
		return chk;
	}

	public void setChk(String chk) {
		this.chk = chk;
	}

	@Override
	public String toString() {
		return "Note [m_id=" + m_id + ", cardnum=" + cardnum + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", inputdate=" + inputdate + ", title=" + title + ", content=" + content + ", chk=" + chk + "]";
	}

}