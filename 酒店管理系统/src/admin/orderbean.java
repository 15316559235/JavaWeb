package admin;

public class orderbean {
    // 属性声明
    private String Oid;
    private String Ocid;
    private String Ocname;
    private String Ocnum;
    private String Octel;
    private String Oinf;
    private String Ostatus;
    private String Ornum;
    private int Oprice;
    private String starttime;
    private String endtime;

    // 访问方法
    public String getOid(){ return this.Oid; }
    public String getOcid(){ return this.Ocid; }
    public String getOcname() { return this.Ocname; }
    public String getOcnum(){ return this.Ocnum; }
    public String getOctel(){ return this.Octel; }
    public String getOinf(){ return this.Oinf; }
    public String getOstatus(){ return this.Ostatus; }
    public String getOrnum() { return this.Ornum; }
    public int getOprice() { return this.Oprice; }
    public String getStarttime() { return starttime; }
    public String getEndtime() { return endtime; }

    // 修改方法
    public void setOid(String Oid){ this.Oid = Oid; }
    public void setOcid(String Ocid){ this.Ocid = Ocid; }
    public void setOcname(String Ocname){ this.Ocname=Ocname; }
    public void setOcnum(String Ocnum){ this.Ocnum = Ocnum; }
    public void setOctel(String octel) { Octel = octel; }
    public void setOinf(String oinf) { Oinf = oinf; }
    public void setOstatus(String ostatus) { Ostatus = ostatus; }
    public void setOrnum(String ornum) {Ornum=ornum;}
    public void setOprice(int oprice) { Oprice = oprice; }
    public void setStarttime(String starttime){this.starttime=starttime;}
    public void setEndtime(String endtime){this.endtime=endtime;}
}
