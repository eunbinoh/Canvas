package com.canvas.demo;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.canvas.demo.vo.Board;

@Service("bService")
public class boardService {
	@Autowired
	private BoardDAO bdao;
	
	public int getPageCount() {
		return bdao.getPageCount();
	}
	public List<Board> getBoardList(RowBounds rb){
		return bdao.getBoardList(rb);
	}

}
