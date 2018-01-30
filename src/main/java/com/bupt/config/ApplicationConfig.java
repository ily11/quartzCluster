package com.bupt.config;

import com.typesafe.config.Config;
import com.typesafe.config.ConfigFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import javax.sql.DataSource;

/**
 * @author eric
 * @since 27/06/17　10:41
 * 应用程序配置类,外化配置信息到conf/application.conf
 */
@Configuration
@ImportResource({"applicationContext.xml"})
public class ApplicationConfig {
    @Bean
    public Config config(){
        Config config = ConfigFactory.load();
        return config;
    }

    @Bean(value = "dataSource")
    @Qualifier("dataSource")
    public DataSource dataSource(Config config){
        DriverManagerDataSource dataSource = new DriverManagerDataSource();

        dataSource.setDriverClassName(config.getString("db.driver"));
        dataSource.setUrl(config.getString("db.url"));
        dataSource.setUsername(config.getString("db.user"));
        dataSource.setPassword(config.getString("db.password"));

        return dataSource;
    }
}
