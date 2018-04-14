package checkout;

public class singlebean {
    // 属性声明
    private String Rid;
    private String Rname;
    private int Price;
    private String Rimg;
    private String starttime;
    private String endtime;

    // 访问方法
    public String getRid(){ return this.Rid; }
    public String getRname(){ return this.Rname; }
    public int getPrice(){ return this.Price;}
    public String getRimg() { return this.Rimg; }
    public String getStarttime() { return starttime; }
    public String getEndtime() { return endtime; }

    // 修改方法
    public void setRid(String Rid){ this.Rid = Rid; }
    public void setRname(String Rname){ this.Rname = Rname; }
    public void setPrice(int Price){ this.Price=Price;}
    public void setRimg(String Rimg){this.Rimg=Rimg;}
    public void setStarttime(String starttime){this.starttime=starttime;}
    public void setEndtime(String endtime){this.endtime=endtime;}
}
