package com.ssm.tool;

import org.json.JSONArray;

import java.util.List;

public class List_To_Json {
    public static <E> JSONArray toJson(List<E> list){
        JSONArray jsonArray=new JSONArray(list);
        return jsonArray;
    }
}
