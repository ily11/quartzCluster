package com.bupt.job;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by liyan on 18-1-17.
 */
@Service("jobC")
public class jobC {
    public void doJob() throws Exception{
        //设置日期格式
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println(df.format(new Date()) + "  执行jobCCCC任务。。。。。");
    }
}
