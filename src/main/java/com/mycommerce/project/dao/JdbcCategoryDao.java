package com.mycommerce.project.dao;


import com.mycommerce.project.dao.base.CategoryDao;
import com.mycommerce.project.model.Category;

import java.util.List;

class JdbcCategoryDao implements CategoryDao {

    JdbcCategoryDao() {
    }

    @Override
    public Integer addElement(Category object) {
        return null;
    }

    @Override
    public void updateElement(Category object) {

    }

    @Override
    public Category findElementById(Integer integer) {
        return null;
    }

    @Override
    public List<Category> getAllElements() {
        return null;
    }

    @Override
    public void removeElement(Category var1) {

    }

    @Override
    public void removeElement(Integer integer) {

    }
}
