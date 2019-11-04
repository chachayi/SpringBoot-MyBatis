package com.ssm.tool;

import java.io.*;

public class Shuru {

    public static void shuruxinxi(String neirong){
        String path ="F:/aa.txt";
        File file = new File(path);
        OutputStream os = null;
        try {
            os = new FileOutputStream(file,true);
            //写
            String s = neirong+"\r\n";
            os.write(s.getBytes());

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
