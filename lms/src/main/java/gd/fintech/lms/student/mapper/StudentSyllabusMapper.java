package gd.fintech.lms.student.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Syllabus;

@Mapper
public interface StudentSyllabusMapper {
	
	// 학생 : 강의 계획서 내용 보기
	public Syllabus selectStudentSyllabusOne(int lectureNo);
}
