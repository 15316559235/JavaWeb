package customer;

public class customerbean {
    // 属性声明
    private String Cid;
    private String Cname;
    private String Cworkplace;
    private String Cjob;

    // 访问方法
    public String getCid(){ return this.Cid; }
    public String getCname() { return this.Cname; }
    public String getCworkplace(){ return this.Cworkplace; }
    public String getCjob(){ return this.Cjob; }

    // 修改方法
    public void setCid(String Cid){ this.Cid = Cid; }
    public void setCname(String Cname){ this.Cname=Cname; }
    public void setCworkplace(String Cworkplace){ this.Cworkplace = Cworkplace; }
    public void setCjob(String Cjob) { this.Cjob = Cjob; }
}
