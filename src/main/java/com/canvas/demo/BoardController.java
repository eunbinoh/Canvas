package com.canvas.demo;

import java.io.File;
import java.io.IOException;
import java.sql.Blob;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.canvas.demo.vo.Board;
import com.canvas.demo.vo.PageInfo;

@RestController
public class BoardController {
	@Autowired
	private boardService bService;
	
	@RequestMapping("boardList")
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
			throw new BoardException("Board list loading Fail");
		}	
		return mv;
	}
	
	
	@RequestMapping("boardInsertView")
	public ModelAndView boardInsertView(ModelAndView mv) {
		mv.setViewName("boardInsert");
		return mv;
	}
	
	@RequestMapping("boardInsert")
	public ModelAndView insertBoard(@ModelAttribute Board b,@RequestParam String srcImg, ModelAndView mv) {
		
//		@RequestParam("srcImg")MultipartFile uploadFile, HttpServletRequest request
//		if(!uploadFile.getOriginalFilename().equals("")) {
//			String renameFileName = saveFile(uploadFile,request);
//			if(renameFileName!=null) {
//				b.setOriginalFileName(uploadFile.getOriginalFilename());
//				b.setRenameFileName(renameFileName);
//			}
//		}
		System.out.println("srcImg::::"+srcImg);
		if(srcImg!=null) {
			b.setOriginalFileName(srcImg);
		}
		int result = bService.insertBoard(b);
		if(result>0) {
			mv.addObject("b",b);
			mv.setViewName("boardDetail");
			return mv;
		}else {
			throw new BoardException("Board insert Fail");
		}
	}
	
//	public String saveFile(MultipartFile file, HttpServletRequest request) {
//		String root = request.getSession().getServletContext().getRealPath("resources");
//		String savePath = root + "\\buploadFiles";
//		
//		File folder = new File(savePath);
//		if(!folder.exists()) {
//			folder.mkdirs();
//		}
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
//		String originalFileName = file.getOriginalFilename();
//		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))+"."+
//								originalFileName.substring(originalFileName.lastIndexOf(".")+1);
//		String renamePath = folder + "\\" + renameFileName;
//		try {
//			file.transferTo(new File(renamePath));
//		} catch (IllegalStateException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return renameFileName;
//	}
	
	@RequestMapping("boardDetail")
	public ModelAndView bdetail(@RequestParam("boardId") int boardId, @RequestParam("page") Integer page, ModelAndView mv) {
		Board b = bService.selectBoard(boardId,true);
		System.out.println("board:::::"+b);
		if(b!=null) {
			mv.addObject("b",b);
			mv.addObject("page",page);
			mv.setViewName("boardDetailView");
		}else {
			throw new BoardException("게시글 상세보기 실패");
		}
		return mv;
	}

	
	
	
}
