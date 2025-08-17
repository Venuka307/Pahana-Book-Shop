package com.pahanaedu.dao;

public class DAOFactory {
    private static UserDAO userDAO = new UserDAO();
    private static SalesDAO salesDAO = new SalesDAO();

    public static UserDAO getUserDAO() { return userDAO; }
    public static SalesDAO getSalesDAO() { return salesDAO; }
}
