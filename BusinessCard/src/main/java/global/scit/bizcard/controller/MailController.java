package global.scit.bizcard.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.scit.bizcard.util.AuthMail;

@Controller
public class MailController {
	private Integer num;

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	@ResponseBody
	@RequestMapping(value = "emailcheck", method = RequestMethod.POST)
	public void emailcheck(String user, HttpSession session) {
		System.out.println(user);
		AuthMail mail = new AuthMail("", null, null);
		int code = mail.test(user);
		setNum(code);
		System.out.println(code);
	}

	@RequestMapping(value = "checknum", method = RequestMethod.POST)
	public @ResponseBody Integer checknum() {
		Integer result = getNum();
		return result;
	}
}