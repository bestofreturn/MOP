package com.kh.mop.scheduler.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mop.scheduler.domain.Scheduler;

@Repository
public class ScedulerStoreLogic implements SchedulerStore{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertScheduler(Scheduler scheduler) {
		int result = sqlSession.insert("SchedulerMapper.insertScheduler", scheduler);
		return result;

	}

	@Override
	public int deleteScheduler(int sId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateScheduler(int sId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int detailScheduler(int sId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Scheduler> selectSubView() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectOneScheduler(int sId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Scheduler> selectList() {
		
		return (ArrayList)sqlSession.selectList("SchedulerMapper.selectListScheduler");
		
		
	}

}
