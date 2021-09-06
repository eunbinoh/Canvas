package com.canvas.demo;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.canvas.demo.vo.Board;
import com.canvas.demo.vo.PageInfo;

@Mapper
public interface BoardDAO {

	public int getPageCount();
	public List<Board> getBoardList(RowBounds rb);
	public int insertBoard(Board b);
	public Board selectBoard(int boardId);
	public int upCount(int boardId);



}