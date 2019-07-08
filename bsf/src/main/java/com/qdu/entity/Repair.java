package com.qdu.entity;

/**
 * @Author huahonglei
 * @Version 2019/6/29
 */
public class Repair {

    private Integer id;
    private String createTime;
    private Adress adress;
    private String detailInf;
    private User user;
    private String hasRepair;
    private Type type;
    private User repairman;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public Adress getAdress() {
        return adress;
    }

    public void setAdress(Adress adress) {
        this.adress = adress;
    }

    public String getDetailInf() {
        return detailInf;
    }

    public void setDetailInf(String detailInf) {
        this.detailInf = detailInf;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


    public String getHasRepair() {
        return hasRepair;
    }

    public void setHasRepair(String hasRepair) {
        this.hasRepair = hasRepair;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public User getRepairman() {
        return repairman;
    }

    public void setRepairman(User repairman) {
        this.repairman = repairman;
    }
}
