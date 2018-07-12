package com.oaec.pojo;

public class Student {
	private int id;
	private String sno;
	private String sname;
	private String sage;
	private String smajor;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSage() {
		return sage;
	}
	public void setSage(String sage) {
		this.sage = sage;
	}
	public String getSmajor() {
		return smajor;
	}
	public void setSmajor(String smajor) {
		this.smajor = smajor;
	}
	public Student() {
		super();
	}
	public Student(int id, String sno, String sname, String sage, String smajor) {
		super();
		this.id = id;
		this.sno = sno;
		this.sname = sname;
		this.sage = sage;
		this.smajor = smajor;
	}
	
}
