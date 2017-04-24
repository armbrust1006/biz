package global.scit.bizcard.vo;

import java.util.Date;

public class CardImage {
	private int cardNum, layout_num;
	private String m_id, cardType, imagePath, shared;
	private Date inputDate;

	public int getCardNum() {
		return cardNum;
	}

	public void setCardNum(int cardNum) {
		this.cardNum = cardNum;
	}

	public int getLayout_num() {
		return layout_num;
	}

	public void setLayout_num(int layout_num) {
		this.layout_num = layout_num;
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
		return "CardImage [cardNum=" + cardNum + ", layout_num=" + layout_num + ", m_id=" + m_id + ", cardType="
				+ cardType + ", imagePath=" + imagePath + ", shared=" + shared + ", inputDate=" + inputDate + "]";
	}

}
