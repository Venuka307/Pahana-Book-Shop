package com.pahanaedu.dao;

public class DAOFactory {

    private static UserDAO userDAO = new UserDAO();

    public static UserDAO getUserDAO() {
        return userDAO;
    }

}
