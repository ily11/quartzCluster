package com.bupt.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * Created by liyan on 18-1-17.
 */
public class LogFactory {
    private static String loggerName = "access";
    public static final Logger logger = LoggerFactory.getLogger(loggerName);

    /**
     * 根据name参数获取一个Logger对象
     * @param name
     * @return
     */
    public static Logger logger(String name){
        return LoggerFactory.getLogger(name);
    }
}
