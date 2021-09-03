package com.canvas.demo;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.canvas.demo.vo.Board;
import com.canvas.demo.vo.PageInfo;

@RestController
public class BoardController {
	@Autowired
	private boardService bService;
	
	@RequestMapping("/boardList")
	public ModelAndView boardList(@RequestParam(value="page",required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page!=null) {
			currentPage = page;
		}
		int listCount = bService.getPageCount();
		PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
		
		int offset = pi.getboardLimit()*(pi.getCurrentPage()-1);
		RowBounds rb = new RowBounds(offset, pi.getboardLimit());
		
		List<Board> boardList = bService.getBoardList(rb);
		if(boardList!=null) {
			mv.addObject("boardList",boardList).addObject("pi",pi);
			mv.setViewName("boardList");
		}else {
			System.out.println("게시판 목록 조회 실패");
		}	
		return mv;
	}
	
	

	
	
	
}
