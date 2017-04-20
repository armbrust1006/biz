package global.scit.bizcard.vo;

public class Message {
	private String targetId;
	private String sender;
	private String message;
	private String senddate;
	private String opendate;
	private String type;
	private int book_num;

	public Message() {
		// TODO Auto-generated constructor stub
	}

	public Message(String targetId, String sender, String message, String senddate, String opendate, String type,
			int book_num) {
		super();
		this.targetId = targetId;
		this.sender = sender;
		this.message = message;
		this.senddate = senddate;
		this.opendate = opendate;
		this.type = type;
		this.book_num = book_num;
	}

	public String getTargetId() {
		return targetId;
	}

	public void setTargetId(String targetId) {
		this.targetId = targetId;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getSenddate() {
		return senddate;
	}

	public void setSenddate(String senddate) {
		this.senddate = senddate;
	}

	public String getOpendate() {
		return opendate;
	}

	public void setOpendate(String opendate) {
		this.opendate = opendate;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getBook_num() {
		return book_num;
	}

	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}

	@Override
	public String toString() {
		return "Message [targetId=" + targetId + ", sender=" + sender + ", message=" + message + ", senddate="
				+ senddate + ", opendate=" + opendate + ", type=" + type + ", book_num=" + book_num + "]";
	}

}
