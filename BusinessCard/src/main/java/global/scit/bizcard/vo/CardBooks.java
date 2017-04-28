package global.scit.bizcard.vo;

import java.util.Date;

public class CardBooks {
	private int book_num;
	private String m_id;
	private String book_name;
	private String grade;
	private Date inputdate;
	private String book_master;
	private String memberCount;

	public CardBooks() {

	}

	public CardBooks(int book_num, String m_id, String book_name, String grade, Date inputdate, String book_master,
			String memberCount) {
		super();
		this.book_num = book_num;
		this.m_id = m_id;
		this.book_name = book_name;
		this.grade = grade;
		this.inputdate = inputdate;
		this.book_master = book_master;
		this.memberCount = memberCount;
	}

	public int getBook_num() {
		return book_num;
	}

	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public Date getInputdate() {
		return inputdate;
	}

	public void setInputdate(Date inputdate) {
		this.inputdate = inputdate;
	}

	public String getBook_master() {
		return book_master;
	}

	public void setBook_master(String book_master) {
		this.book_master = book_master;
	}

	public String getMemberCount() {
		return memberCount;
	}

	public void setMemberCount(String memberCount) {
		this.memberCount = memberCount;
	}

	@Override
	public String toString() {
		return "CardBooks [book_num=" + book_num + ", m_id=" + m_id + ", book_name=" + book_name + ", grade=" + grade
				+ ", inputdate=" + inputdate + ", book_master=" + book_master + ", memberCount=" + memberCount + "]";
	}

}