package staff;

public class staffbean {
    // 属性声明
    private String Gid;
    private String Gname;
    private String Ggrade;
    private String Gidentify;
    private String branch_id;

    // 访问方法
    public String getid(){ return this.Gid; }
    public String getGname() { return this.Gname; }
    public String getGgrade(){ return this.Ggrade; }
    public String getGidentify(){ return this.Gidentify; }

    public String getBranch_id() {
        return branch_id;
    }

    // 修改方法
    public void setGid(String Gid){ this.Gid = Gid; }
    public void setGname(String Gname){ this.Gname=Gname; }
    public void setGgrade(String Ggrade){ this.Ggrade = Ggrade; }
    public void setGidentify(String Cidentify) { this.Gidentify = Cidentify; }
    public void setBranch_id(String branch_id){
        this.branch_id=branch_id;
    }
}
