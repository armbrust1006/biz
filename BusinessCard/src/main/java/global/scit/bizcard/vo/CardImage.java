package global.scit.bizcard.vo;

import java.util.Date;

public class CardImage {
	private int cardNum;
	private String m_id, cardType, imagePath, shared;
	private Date inputDate;

	public CardImage() {
	}

	public CardImage(int cardNum, String m_id, String cardType, String imagePath, String shared, Date inputDate) {
		super();
		this.cardNum = cardNum;
		this.m_id = m_id;
		this.cardType = cardType;
		this.imagePath = imagePath;
		this.shared = shared;
		this.inputDate = inputDate;
	}

	public CardImage(String m_id, int cardNum, String cardType, Date inputDate) {
		this.cardNum = cardNum;
		this.m_id = m_id;
		this.cardType = cardType;
		this.inputDate = inputDate;
	}

	public int getCardNum() {
		return cardNum;
	}

	public void setCardNum(int cardnum) {
		this.cardNum = cardnum;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public Date getInputdate() {
		return inputDate;
	}

	public void setInputdate(Date inputDate) {
		this.inputDate = inputDate;
	}

	public String getShared() {
		return shared;
	}

	public void setShared(String shared) {
		this.shared = shared;
	}

	public Date getInputDate() {
		return inputDate;
	}

	public void setInputDate(Date inputDate) {
		this.inputDate = inputDate;
	}

	@Override
	public String toString() {
		return "CardImage [cardNum=" + cardNum + ", m_id=" + m_id + ", cardType=" + cardType + ", imagePath="
				+ imagePath + ", shared=" + shared + ", inputDate=" + inputDate + "]";
	}

}
