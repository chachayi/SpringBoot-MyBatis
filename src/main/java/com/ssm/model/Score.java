package com.ssm.model;

import java.io.Serializable;

public class Score implements Serializable {

    int sId;
    int cId;
    int sScore;

    public int getsId() {
        return sId;
    }

    public void setsId(int sId) {
        this.sId = sId;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public int getsScore() {
        return sScore;
    }

    public void setsScore(int sScore) {
        this.sScore = sScore;
    }
}
