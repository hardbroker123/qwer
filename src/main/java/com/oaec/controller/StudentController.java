package com.oaec.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oaec.pojo.Student;
import com.oaec.service.StudentService;

@Controller
@RequestMapping("/pages")
public class StudentController {
	@Autowired
	StudentService studentService;
	
	@RequestMapping("/getAllStudent")
	public List<Student> getAllStudent(){
		return studentService.getAllStudent();
	}
	
	
	
	
	public StudentService getStudentService() {
		return studentService;
	}
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
}
