package test;

public class testbean{
    // 属性声明
    private String Id;
    private String Question;
    private String Answer;
    private String AnswerA;
    private String AnswerB;
    private String AnswerC;
    private String AnswerD;

    // 访问方法
    public String getId(){ return this.Id; }
    public String getQuestion(){ return this.Question; }
    public String getAnswer(){ return this.Answer; }
    public String getAnswerA(){ return this.AnswerA; }
    public String getAnswerB(){ return this.AnswerB; }
    public String getAnswerC(){ return this.AnswerC; }
    public String getAnswerD(){ return this.AnswerD; }

    // 修改方法
    public void setId(String Id){ this.Id = Id; }
    public void setQuestion(String Question){ this.Question = Question; }
    public void setAnswer(String Answer){ this.Answer = Answer; }
    public void setAnswerA(String AnswerA){ this.AnswerA = AnswerA; }
    public void setAnswerB(String AnswerB){ this.AnswerB = AnswerB; }
    public void setAnswerC(String AnswerC){ this.AnswerC = AnswerC; }
    public void setAnswerD(String AnswerD){ this.AnswerD = AnswerD; }
}

