package com.oaec.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.oaec.pojo.Student;

@Repository
public interface StudentMapper {
	
	public List<Student> selectAllStudent();
}
