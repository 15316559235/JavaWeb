package message_board;

public class messagebean{
    // 属性声明
    private String Name;
    private String Mail;
    private String Subject;
    private String Message;

    // 访问方法
    public String getName(){ return this.Name; }
    public String getMail(){ return this.Mail; }
    public String getSubject() { return this.Subject; }
    public String getMessage(){ return this.Message; }

    // 修改方法
    public void setName(String Name){ this.Name = Name; }
    public void setMail(String Mail){ this.Mail = Mail; }
    public void setSubject(String Subject){ this.Subject=Subject;}
    public void setMessage(String Message){ this.Message = Message; }
}
