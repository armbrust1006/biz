package global.scit.bizcard.vo;

import java.util.Arrays;

public class OCRData {
	private int[] imgSize;
	private int[][] getterValue;
	private int layout_num;
	private String m_id, cardType, language, imagePath;

	public int[] getImgSize() {
		return imgSize;
	}

	public void setImgSize(int[] imgSize) {
		this.imgSize = imgSize;
	}

	public int[][] getGetterValue() {
		return getterValue;
	}

	public void setGetterValue(int[][] getterValue) {
		this.getterValue = getterValue;
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

	public int getLayout_num() {
		return layout_num;
	}

	public void setLayout_num(int layout_num) {
		this.layout_num = layout_num;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	@Override
	public String toString() {
		return "OCRData [imgSize=" + Arrays.toString(imgSize) + ", getterValue=" + Arrays.toString(getterValue)
				+ ", layout_num=" + layout_num + ", m_id=" + m_id + ", cardType=" + cardType + ", language=" + language
				+ ", imagePath=" + imagePath + "]";
	}

}
