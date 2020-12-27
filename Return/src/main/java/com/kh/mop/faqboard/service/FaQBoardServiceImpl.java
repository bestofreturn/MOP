package com.kh.mop.faqboard.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mop.faqboard.domain.FaQBoard;
import com.kh.mop.faqboard.store.FaQBoardStore;
import com.kh.mop.freeboard.domain.FreeBoardPageInfo;

@Service
public class FaQBoardServiceImpl implements FaQBoardService{
	
	@Autowired
	private FaQBoardStore faqStore;

	@Override
	public int getListCount() {
		return faqStore.getListCount();
	}

	@Override
	public int addReadCount(int faqId) {
		return faqStore.addReadCount(faqId);
	}

	@Override
	public FaQBoard selectFaQBoard(int faqId) {
		return faqStore.selectFaQBoard(faqId);
	}

	@Override
	public int updateFaQBoard(FaQBoard faqBoard) {
		return faqStore.updateFaQBoard(faqBoard);
	}

	@Override
	public int deleteFaQBoard(int faqId) {
		return faqStore.deleteFaQBoard(faqId);
	}

	@Override
	public int insertFaQBoard(FaQBoard faqBoard) {
		return faqStore.insertFaQBoard(faqBoard);
	}

	@Override
	public ArrayList<FaQBoard> selectList(FreeBoardPageInfo pi) {
		return faqStore.selectList(pi);
	}
}
