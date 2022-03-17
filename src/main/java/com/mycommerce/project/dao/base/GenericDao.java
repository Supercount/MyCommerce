package com.mycommerce.project.dao.base;

import java.util.List;

public interface GenericDao<T, ID extends Number> {

    ID addElement(T object);

    void updateElement(T object);

    T findElementById(ID id);

    List<T> getAllElements();

    void removeElement(T var1);

    void removeElement(ID id);
}
