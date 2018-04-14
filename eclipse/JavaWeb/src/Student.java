import java.util.*;
import java.io.*;

public class Student {
	private String sno;
	private String name;
	
	public Student(String sno1,String name1) {
		sno=sno1;
		name=name1;
	}
	
	public void Change(String sno1,String name1) {
		sno=sno1;
		name=name1;
	}
	
	public String Printsno(Student s) {
		return s.sno;
	}
	
	public String Printname(Student s) {
		return s.name;
	}
}
