package com.kh.mop.freeboard.service;

import java.util.ArrayList;

import com.kh.mop.freeboard.domain.FreeBoard;
import com.kh.mop.freeboard.domain.FreeBoardPageInfo;

public interface FreeBoardService {

	/**
	 * 게시판 전체 수 조회
	 * @return
	 */
	public int getListCount();
	
	public ArrayList<FreeBoard> selectList(FreeBoardPageInfo pi);
	public int addReadCount(int fId);
	public FreeBoard selectFreeBoard(int fId);
	public int updateFreeBoard(FreeBoard freeBoard);
	public int deleteFreeBoard(FreeBoard freeBoard);
	public int insertFreeBoard(FreeBoard freeBoard);
	
}
