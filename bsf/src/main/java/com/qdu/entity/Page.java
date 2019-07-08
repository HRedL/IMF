package com.qdu.entity;

import java.util.List;

public class Page<T> {
    private List<T> datas;
    private Integer pageNumber;
    private Integer totalNumber;
    private Integer totalSize;
    private List<Integer> showNumber;

    public List<Integer> getShowNumber() {
        return showNumber;
    }

    public void setShowNumber(List<Integer> showNumber) {
        this.showNumber = showNumber;
    }

    public List<T> getDatas() {
        return datas;
    }

    public void setDatas(List<T> datas) {
        this.datas = datas;
    }

    public Integer getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber) {
        this.pageNumber = pageNumber;
    }

    public Integer getTotalNumber() {
        return totalNumber;
    }

    public void setTotalNumber(Integer totalNumber) {
        this.totalNumber = totalNumber;
    }

    public Integer getTotalSize() {
        return totalSize;
    }

    public void setTotalSize(Integer totalSize) {
        this.totalSize = totalSize;
    }
}
