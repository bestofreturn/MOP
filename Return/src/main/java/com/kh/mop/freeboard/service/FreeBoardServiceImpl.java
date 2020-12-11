package com.kh.mop.freeboard.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mop.freeboard.domain.FreeBoard;
import com.kh.mop.freeboard.domain.FreeBoardPageInfo;
import com.kh.mop.freeboard.domain.FreeBoardReply;
import com.kh.mop.freeboard.store.FreeBoardStore;

@Service
public class FreeBoardServiceImpl implements FreeBoardService{

	@Autowired
	private FreeBoardStore fStore;
	
	@Override
	public int getListCount() {
		return fStore.getListCount();
	}

	@Override
	public ArrayList<FreeBoard> selectList(FreeBoardPageInfo pi) {
		return fStore.selectList(pi);
	}

	@Override
	public int addReadCount(int fId) {
		return fStore.addReadCount(fId);
	}

	@Override
	public FreeBoard selectFreeBoard(int fId) {
		return fStore.selectFreeBoard(fId);
	}

	@Override
	public int updateFreeBoard(FreeBoard freeBoard) {
		return fStore.updateFreeBoard(freeBoard);
	}

	@Override
	public int deleteFreeBoard(int fId) {
		return fStore.deleteFreeBoard(fId);
	}

	@Override
	public int insertFreeBoard(FreeBoard freeBoard) {
		return fStore.insertFreeBoard(freeBoard);
	}

	@Override
	public ArrayList<FreeBoardReply> selectFreeBoardReplyList(int fId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertFreeBoardReply(FreeBoardReply freeBoardReply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateFreeBoardReply(FreeBoardReply freeBoardReply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFreeBoardReply(int fbrId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
