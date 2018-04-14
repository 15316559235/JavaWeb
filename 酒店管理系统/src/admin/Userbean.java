package admin;

public class Userbean {
    // 属性声明
    private String Cid;
    private String Cname;
    private String Cnum;
    private String Ctel;
    private String Ctype;

    // 访问方法
    public String getCid(){ return this.Cid; }
    public String getCname() { return this.Cname; }
    public String getCnum(){ return this.Cnum; }
    public String getCtel(){ return this.Ctel; }
    public String getCtype() { return this.Ctype; }

    // 修改方法
    public void setCid(String Cid){ this.Cid = Cid; }
    public void setCname(String Cname){ this.Cname=Cname; }
    public void setCnum(String Cnum){ this.Cnum = Cnum; }
    public void setCtel(String Ctel) { this.Ctel = Ctel; }
    public void setCtype(String Ctype) { this.Ctype = Ctype; }
}
