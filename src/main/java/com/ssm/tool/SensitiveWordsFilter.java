package com.ssm.tool;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SensitiveWordsFilter {

    private static List<String> banWords = new ArrayList<String>(); // 禁用词

    static{
        try {
            init();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void init() throws Exception {
        String path = SensitiveWordsFilter.class.getClassLoader().getResource("sensitive-words/words.txt").getPath();
        //File file = new File(path);
        InputStreamReader reader = new InputStreamReader(new FileInputStream(path),"UTF-8");
        //FileReader reader = new FileReader(path);
        BufferedReader br = new BufferedReader(reader);
        String line = null;
        while ((line = br.readLine()) != null) {
            String[] s = line.split("\\|");
            banWords.add(s[0].trim());
        }
        br.close();
    }

    public static String replace(String data){
        for (String regex : banWords) {
            Pattern pattern = Pattern.compile(regex); // Pattern类用于创建一个正则表达式,也可以说创建一个匹配模式
            Matcher m = pattern.matcher(data); // 看data数据里面有没有和该正则表达式相匹配的内容
            if (m.find()) { // 匹配器的find方法若返回true，则客户机提交的数据里面有和正则表达式相匹配的内容
                data = data.replaceAll(regex,"**");
            }
        }
        return  data;
    }
}
