package com.bupt.job;

import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by liyan on 18-1-18.
 */
@Service("jobBB")
public class jobBB {
    public void doJob() throws Exception{
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        System.out.println(df.format(new Date()) + "  执行jobBBBB任务。。。。。");
    }
}
