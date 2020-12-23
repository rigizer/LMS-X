package gd.fintech.lms.student.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.student.mapper.StudentNoteMapper;
import gd.fintech.lms.vo.Note;

@Service
public class StudentNoteService {
	@Autowired StudentNoteMapper studentNoteMapper;
	
	// 쪽지 수신 목록 가져오기
	public List<Note> selectNoteReceiveListByPage(Map<String, Object> map){
		return studentNoteMapper.selectNoteReceiveListByPage(map);
	}
	
	// 쪽지 수신 개수 가져오기
	public int selectNoteReceiveListCount(String accountId) {
		return studentNoteMapper.selectNoteReceiveListCount(accountId);
	}
	
	// 쪽지 발신 목록 가져오기
	public List<Note> selectNoteDispatchListByPage(Map<String, Object> map){
		return studentNoteMapper.selectNoteDispatchListByPage(map);
	}
	
	// 쪽지 수신 개수
	public int selectNoteDispatchListCount(String accountId) {
		return studentNoteMapper.selectNoteDispatchListCount(accountId);
	}
	
	// 쪽지 상세보기 - 수신함에서
	public Note selectNoteReceiveOne(int noteNo) {
		studentNoteMapper.updateNoteIsRead(noteNo);
		return studentNoteMapper.selectNoteOne(noteNo);
	}
	// 쪽지 상세보기 - 발신함에서
	public Note selectNoteDispatchOne(int noteNo) {
		return studentNoteMapper.selectNoteOne(noteNo);
	}
	
	// 쪽지 보내기
	public int insertNote(Note note) {
		return studentNoteMapper.insertNote(note);
	}
}
