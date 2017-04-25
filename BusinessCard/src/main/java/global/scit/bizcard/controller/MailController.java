package global.scit.bizcard.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.scit.bizcard.util.AuthMail;
import global.scit.bizcard.util.SendMail;

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
	
	@ResponseBody
     @RequestMapping(value="sendMail", method=RequestMethod.POST)
     public int sendMail(String my_id, String my_Password, String user, String title, String message, HttpSession session, Model model)
     {
   	   int result= SendMail.sendResult(my_id, my_Password, user, title, message);
   	   
   	   System.out.println(result+"메일컨트롤러에서 보내는 result값");
   	   model.addAttribute("result", result);
   	   return result;
   	   
     }
	
	
	
}