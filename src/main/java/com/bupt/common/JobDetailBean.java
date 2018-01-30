package com.bupt.common;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.scheduling.quartz.QuartzJobBean;

import java.lang.reflect.Method;

public class JobDetailBean extends QuartzJobBean {


    private Logger logger = LoggerFactory.getLogger(JobDetailBean.class);

    private String targetObject;
    private String targetMethod;
    private static ApplicationContext ctx;

    @Override
    protected void executeInternal(JobExecutionContext context) throws JobExecutionException {

        try {
            Object ctxBean = ctx.getBean(this.targetObject);
            try {
                Method m = ctxBean.getClass().getMethod(targetMethod);
                m.invoke(ctxBean);
            } catch (SecurityException e) {
                logger.error(e.toString());
                e.printStackTrace();
            } catch (NoSuchMethodException e) {
                logger.error(e.toString());
                e.printStackTrace();
            }
        } catch (Exception e) {
            throw new JobExecutionException(e);
        }
    }

    public static void setApplicationContext(ApplicationContext applicationContext) {
        ctx = applicationContext;
    }

    public void setTargetObject(String targetObject) {
        this.targetObject = targetObject;
    }

    public void setTargetMethod(String targetMethod) {
        this.targetMethod = targetMethod;
    }
}