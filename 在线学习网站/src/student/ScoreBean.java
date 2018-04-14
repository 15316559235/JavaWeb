package student;

import java.io.Serializable;

public class ScoreBean implements Serializable {
       private int Grade;
       private String Course;
       
       public ScoreBean(int Grade,String Course) {
    	      this.Grade=Grade;
    	      this.Course=Course;
       }
       
       public int getGrade() { return Grade;}
       public String getCourse() { return Course;}
       
       public void setGrade(int Grade) { this.Grade=Grade;}
       public void setCourse(String Course) { this.Course=Course;}
}
