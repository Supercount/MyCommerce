package com.mycommerce.project.utils;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class PersistanceManager {

    private static EntityManagerFactory emf;

    public static EntityManagerFactory getEmf() {
        if (emf == null) {
            emf = Persistence.createEntityManagerFactory("ecommerce");
        }
        return emf;
    }

    private PersistanceManager(){}

    public static void closeEmf() {
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }
}
