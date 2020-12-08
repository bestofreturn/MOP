package com.kh.mop.freeboard.service;

import java.util.ArrayList;

import com.kh.mop.freeboard.domain.FreeBoard;
import com.kh.mop.freeboard.domain.FreeBoardPageInfo;
import com.kh.mop.freeboard.domain.FreeBoardReply;

public interface FreeBoardService {


	public int getListCount();
	public ArrayList<FreeBoard> selectList(FreeBoardPageInfo pi);
	public int addReadCount(int fId);
	public FreeBoard selectFreeBoard(int fId);
	public int updateFreeBoard(FreeBoard freeBoard);
	public int deleteFreeBoard(FreeBoard freeBoard);
	public int insertFreeBoard(FreeBoard freeBoard);
	public ArrayList<FreeBoardReply> selectFreeBoardReplyList(int fId);
	public int insertFreeBoardReply(FreeBoardReply freeBoardReply);
	public int updateFreeBoardReply(FreeBoardReply freeBoardReply);
	public int deleteFreeBoardReply(int fbrId);
	
}
