package com.oaec.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oaec.mapper.StudentMapper;
import com.oaec.pojo.Student;
import com.oaec.service.StudentService;
@Service
public class StudentServiceImpl implements StudentService{
	@Autowired
	StudentMapper studentMapper;
	
	
	
	
	public List<Student> getAllStudent() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	
	
	
	
	public StudentMapper getStudentMapper() {
		return studentMapper;
	}

	public void setStudentMapper(StudentMapper studentMapper) {
		this.studentMapper = studentMapper;
	}


}
