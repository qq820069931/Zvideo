package com.joinlabs;

import org.apache.log4j.Logger;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
public class app {
    public static void main(String[] args) {
        SpringApplication.run(app.class,args);
        Logger log = Logger.getLogger(app.class.getClass());
        log.debug("debug");
    	System.out.println("sss");


    }
}
