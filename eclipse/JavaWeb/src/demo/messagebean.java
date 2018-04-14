package demo;
public class messagebean{
    // 属性声明
    private String Name;
    private String Title;
    private String Message;

    // 访问方法
    public String getName(){ return this.Name; }
    public String getTitle(){ return this.Title; }
    public String getMessage(){ return this.Message; }

    // 修改方法
    public void setName(String Name){ this.Name = Name; }
    public void setTitle(String Title){ this.Title = Title; }
    public void setMessage(String Message){ this.Message = Message; }
}