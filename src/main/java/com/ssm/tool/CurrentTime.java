package com.ssm.tool;

public class CurrentTime {
    public static java.sql.Date getCurrentTime(){
        long time = System.currentTimeMillis();//获取当前时间并转换类型
        return new java.sql.Date(time);
    }
}
