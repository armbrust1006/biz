package global.scit.bizcard.vo;

import java.util.Date;

public class Reply {

	private int reply_num; // 댓글 번호
	private int shared_cardnum; // 공유 명함 카드 번호
	private int cardnum; // 카드 일련번호
	private String m_id; // 아이디
	private String inputdate; // 등록날짜
	private String reply; // 댓글 내용

	public Reply() {
		super();
	}

	public Reply(int reply_num, int shared_cardnum, int cardnum, String m_id, String inputdate, String reply) {
		super();
		this.reply_num = reply_num;
		this.shared_cardnum = shared_cardnum;
		this.cardnum = cardnum;
		this.m_id = m_id;
		this.inputdate = inputdate;
		this.reply = reply;
	}

	public int getReply_num() {
		return reply_num;
	}

	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}

	public int getShared_cardnum() {
		return shared_cardnum;
	}

	public void setShared_cardnum(int shared_cardnum) {
		this.shared_cardnum = shared_cardnum;
	}

	public int getCardnum() {
		return cardnum;
	}

	public void setCardnum(int cardnum) {
		this.cardnum = cardnum;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	@Override
	public String toString() {
		return "Reply [reply_num=" + reply_num + ", shared_cardnum=" + shared_cardnum + ", cardnum=" + cardnum
				+ ", m_id=" + m_id + ", inputdate=" + inputdate + ", reply=" + reply + "]";
	}

	

	
}
