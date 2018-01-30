package com.bupt;


import com.bupt.common.JobDetailBean;
import com.bupt.config.ApplicationConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/**
 * Created by liyan on 18-1-17.
 */
public class MainProgram {
    final static Logger logger = LoggerFactory.getLogger(MainProgram.class);
    public static void main(String[] args){
        try{
            System.out.println("开始执行任务。。。。。");
            AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext("com.bupt.config");
            JobDetailBean.setApplicationContext(ctx);
        }catch (Exception e){
            logger.error(e.getMessage());
        }
    }
}
