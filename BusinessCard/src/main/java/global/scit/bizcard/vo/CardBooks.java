package global.scit.bizcard.vo;

public class CardBooks {
	private int book_num;
	private String m_id;
	private String book_name;
	private String grade;
	private String room_host;
	private String memberCount;

	public CardBooks() {

	}

	public CardBooks(int book_num, String m_id, String book_name, String grade, String room_host, String memberCount) {
		super();
		this.book_num = book_num;
		this.m_id = m_id;
		this.book_name = book_name;
		this.grade = grade;
		this.room_host = room_host;
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

	public String getRoom_host() {
		return room_host;
	}

	public void setRoom_host(String room_host) {
		this.room_host = room_host;
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
				+ ", room_host=" + room_host + ", memberCount=" + memberCount + "]";
	}
}