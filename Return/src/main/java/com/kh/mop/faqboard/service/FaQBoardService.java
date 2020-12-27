package com.kh.mop.faqboard.service;


import java.util.ArrayList;

import com.kh.mop.faqboard.domain.FaQBoard;
import com.kh.mop.freeboard.domain.FreeBoardPageInfo;

public interface FaQBoardService {
	
	public int getListCount();
	public int addReadCount(int faqId);
	public FaQBoard selectFaQBoard(int faqId);
	public int updateFaQBoard(FaQBoard faqBoard);
	public int deleteFaQBoard(int faqId);
	public int insertFaQBoard(FaQBoard faqBoard);
	public ArrayList<FaQBoard> selectList(FreeBoardPageInfo pi);
}
