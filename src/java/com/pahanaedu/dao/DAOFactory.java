package com.pahanaedu.dao;

public class DAOFactory {

    
    public static UserDAO getUserDAO() {
        return new UserDAO();
    }

    
}
