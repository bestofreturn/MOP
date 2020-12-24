package com.kh.mop.schedulerGroup.service;

import java.util.ArrayList;


import com.kh.mop.schedulerGroup.domain.SchedulerGroup;

public interface SchedulerGroupService {
	
	public int insertSchedulerGroup(SchedulerGroup schedulergroup);
	public int updateSchdedulerGroup(SchedulerGroup schedulergroup);
	public int selectOneSchedulerGroup(int gId);
	public int deleteSchedulerGroup(int gId);
	public int detailSchedulerGroup(int gId);
	public ArrayList<SchedulerGroup> selectSubView();
	public ArrayList<SchedulerGroup> selectList();;
}
