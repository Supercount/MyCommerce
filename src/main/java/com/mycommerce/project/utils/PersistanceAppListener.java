package com.mycommerce.project.utils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class PersistanceAppListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {

    }

    public PersistanceAppListener() {
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        PersistanceManager.closeEmf();
    }
}
