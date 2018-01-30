package com.bupt.job;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by liyan on 18-1-17.
 */

@Component
public class jobA {
    @Scheduled(cron = "*/1 * * * * ?")
    // 每隔5秒执行一次
    public void test() throws Exception{
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        System.out.println(df.format(new Date()) + "  执行jobAAAA任务。。。。。");
    }
}
