package global.scit.bizcard.vo;

import java.util.Date;

public class Card extends CardImage {
	private String name, company, depart, position, address, email, telephone, fax, mobile, language, logoImg,
			imgOriginal;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getDepart() {
		return depart;
	}

	public void setDepart(String depart) {
		this.depart = depart;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getLogoImg() {
		return logoImg;
	}

	public void setLogoImg(String logoImg) {
		this.logoImg = logoImg;
	}

	public String getImgOriginal() {
		return imgOriginal;
	}

	public void setImgOriginal(String imgOriginal) {
		this.imgOriginal = imgOriginal;
	}

	@Override
	public int getCardNum() {
		// TODO Auto-generated method stub
		return super.getCardNum();
	}

	@Override
	public void setCardNum(int cardNum) {
		// TODO Auto-generated method stub
		super.setCardNum(cardNum);
	}

	@Override
	public int getLayout_num() {
		// TODO Auto-generated method stub
		return super.getLayout_num();
	}

	@Override
	public void setLayout_num(int layout_num) {
		// TODO Auto-generated method stub
		super.setLayout_num(layout_num);
	}

	@Override
	public String getM_id() {
		// TODO Auto-generated method stub
		return super.getM_id();
	}

	@Override
	public void setM_id(String m_id) {
		// TODO Auto-generated method stub
		super.setM_id(m_id);
	}

	@Override
	public String getCardType() {
		// TODO Auto-generated method stub
		return super.getCardType();
	}

	@Override
	public void setCardType(String cardType) {
		// TODO Auto-generated method stub
		super.setCardType(cardType);
	}

	@Override
	public String getImagePath() {
		// TODO Auto-generated method stub
		return super.getImagePath();
	}

	@Override
	public void setImagePath(String imagePath) {
		// TODO Auto-generated method stub
		super.setImagePath(imagePath);
	}

	@Override
	public String getShared() {
		// TODO Auto-generated method stub
		return super.getShared();
	}

	@Override
	public void setShared(String shared) {
		// TODO Auto-generated method stub
		super.setShared(shared);
	}

	@Override
	public Date getInputDate() {
		// TODO Auto-generated method stub
		return super.getInputDate();
	}

	@Override
	public void setInputDate(Date inputDate) {
		// TODO Auto-generated method stub
		super.setInputDate(inputDate);
	}

	@Override
	public String toString() {
		return "Card [name=" + name + ", company=" + company + ", depart=" + depart + ", position=" + position
				+ ", address=" + address + ", email=" + email + ", telephone=" + telephone + ", fax=" + fax
				+ ", mobile=" + mobile + ", language=" + language + ", logoImg=" + logoImg + ", imgOriginal="
				+ imgOriginal + ", toString()=" + super.toString() + "]";
	}

}
