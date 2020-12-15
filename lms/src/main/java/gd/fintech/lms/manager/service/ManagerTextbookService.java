package gd.fintech.lms.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerTextbookMapper;
import gd.fintech.lms.vo.Textbook;


@Service
@Transactional
public class ManagerTextbookService {
	@Autowired ManagerTextbookMapper managerTextbookMapper;
	
	public List<Textbook> getTextbookList() {
		return managerTextbookMapper.selectTextbookList();
	}
}