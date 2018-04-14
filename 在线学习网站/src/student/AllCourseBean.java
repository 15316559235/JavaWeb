package student;

import java.io.Serializable;

public class AllCourseBean implements Serializable {
       private String Teacher;
       private String Course;
       
       public AllCourseBean(String Teacher,String Course) {
    	      this.Teacher= Teacher;
    	      this.Course = Course;
       }
       
       public void setCourse(String Course) {
    	      this.Course = Course;
       }
       
       public void setTeacher(String Teacher) {
    	      this.Teacher= Teacher;
       }
       
       public String getTeacher() { return Teacher;}
       public String getCourse() {  return Course; }
}
