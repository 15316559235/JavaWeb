package student;

public class ChooseCourseBean {
	private String Teacher;
    private String Course;
    
    public ChooseCourseBean(String Teacher,String Course) {
 	      this.Teacher= Teacher;
 	      this.Course = Course;
    }
    
    public ChooseCourseBean() {}
    
    public void setCourse(String Course) {
 	      this.Course = Course;
    }
    
    public void setTeacher(String Teacher) {
 	      this.Teacher= Teacher;
    }
    
    public String getTeacher() { return Teacher;}
    public String getCourse() {  return Course; }
}
