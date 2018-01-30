package com.bupt.job;

import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by liyan on 18-1-18.
 */
@Service("jobAA")
public class jobAA {
    public void doJob() throws Exception{
        //设置日期格式
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //1.加载驱动程序
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://127.0.0.1:3306/quartz?characterEncoding=utf-8&autoReconnect=true&autoReconnectForPools=true&useSSL=false";
        String name = "root";
        String password = "123456";
        //2.获得数据库的连接
        Connection conn = DriverManager.getConnection(url, name, password);
        //3.通过数据库的连接操作数据库，实现增删改查
        Statement stmt = conn.createStatement();
        Boolean result = stmt.execute("UPDATE quartz.Student SET age = '8' WHERE id=2;");
        ResultSet age = stmt.executeQuery("SELECT age FROM quartz.Student WHERE id=2;");
        if(!result){
            System.out.println(df.format(new Date()) + "  执行job1AAAA任务。。。。。");
            while (age.next()){
                System.out.println(df.format(new Date()) + "  job1A任务。。。。。" +age.getString("age"));
            }
//            System.out.println(df.format(new Date()) + "  job1A任务。。。。。" +age.getString("age"));
        }
    }
}
