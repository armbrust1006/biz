package global.scit.bizcard.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import global.scit.bizcard.repository.BoardRepository;
import global.scit.bizcard.repository.CardRepository;
import global.scit.bizcard.vo.Board;
import global.scit.bizcard.vo.CardBooks;

@Controller
public class BoardController {
	

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	BoardRepository boardRepository;
	
	
	@ResponseBody
	@RequestMapping(value = "board_write", method = RequestMethod.POST)
	public void board_write(int book_num,String board_title, String board_content,HttpSession session) {
		
		String id = (String) session.getAttribute("m_id");
		
		System.out.println("방번호"+ book_num);
		System.out.println("타이틀" + board_title);
		System.out.println("내용" + board_content);
		System.out.println("세션 아이디" + id);
		
		int result = 0;
		
		try {
			result = boardRepository.insertB(book_num, board_title, board_content, id);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value = "listB", method = RequestMethod.POST)
	public ArrayList<Board> listB(Board board, int book_num) {

		ArrayList<Board> listB = boardRepository.listB(book_num);
		System.out.println("받아와" + listB);
		return listB;
	}
	
	@ResponseBody
	@RequestMapping(value = "readB", method = RequestMethod.POST)
	public Board readB(Board board, int boardnum) {

		Board readB = boardRepository.readB(boardnum);
		System.out.println("받아와" + readB);
		return readB;
	}

	@ResponseBody
	@RequestMapping(value = "deleteB", method = RequestMethod.POST)
	public void deleteB(int boardnum, int book_num) {

		System.out.println("ajax에서 받아오는 것.." + boardnum);

		int result = 0;
		
		try {
			result = boardRepository.deleteB(boardnum,book_num);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "updateB", method = RequestMethod.POST)
	public void updateB(int boardnum, String content, int book_num) {

		System.out.println("ajax에서 받아오는 것.." + boardnum);
		System.out.println("ajax에서 받아오는 것.." + content);
		System.out.println("ajax에서 받아오는 것.." + book_num);

		int result = 0;
		
		try {
			result = boardRepository.updateB(boardnum, book_num, content);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	
}
