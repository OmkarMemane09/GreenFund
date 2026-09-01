package com.distribute;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.Scanner;

import com.user.DBconn;


public class RemoveStopwords {

    private static Statement st;
    static int maxno;
    public static String slang = null;
   public static String filepath = "D:\\stopwords.txt";
    //String filepath2 = "F:\\stopwords.txt";

    int count = 0;

   

    public String RemoveWords(String data) throws FileNotFoundException {
        boolean flag = false;
        Scanner sc;

        StringBuilder sb = new StringBuilder();

        String[] tokens = data.split("\\P{Alpha}+");// \\p is use for space and
        // {Alpha for (')eg it's}

        for (String s : tokens) {
            sc = new Scanner(new File(DBconn.stopwordspath));

            while (sc.hasNext()) {
                if (sc.next().toLowerCase().equals(s.toLowerCase())) {
                    flag = true;
                    break;
                } else {
                    flag = false;
                }

            }
            if (flag == false) {

                sb.append(s + ",");
            }
        }
        return sb.toString();
    }

   
}
