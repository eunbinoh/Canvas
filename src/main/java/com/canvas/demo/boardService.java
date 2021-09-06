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
	public int insertBoard(Board b) {
		return bdao.insertBoard(b);
	}
	public Board selectBoard(int boardId, boolean check) {
		int result = 0;
		Board b = null;
		if(check) {
			//조회시 카운트 수 올리기
			result = bdao.upCount(boardId);
			if(result>0) {
				b= bdao.selectBoard(boardId);
			}
		}else{
			//수정,에러시 카운트수 증가없이 조회만 하기
			b=bdao.selectBoard(boardId);
		}
		return b;
	}

}
