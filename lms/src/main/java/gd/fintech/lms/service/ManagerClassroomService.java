package gd.fintech.lms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.mapper.ManagerClassroomMapper;
import gd.fintech.lms.vo.Classroom;

@Service
@Transactional
public class ManagerClassroomService {
	@Autowired ManagerClassroomMapper managerClassroomMapper;
	
	public List<Classroom> getClassroomList(){
		return managerClassroomMapper.selectClassroomList();
	}
}