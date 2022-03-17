
package com.mycommerce.project.dao.exception;

public class UnknownCategoryException extends RuntimeException {

    public UnknownCategoryException(Integer id) {
        super("The category with id=" + id + " doesn't exist.");
    }

}
