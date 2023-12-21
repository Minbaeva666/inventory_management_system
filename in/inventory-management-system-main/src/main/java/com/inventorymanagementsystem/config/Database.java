package com.inventorymanagementsystem.config;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class Database {
    private static Database database=new Database();
    public static Database getInstance()
    {
        if (database== null)
            database= new Database();
        return database;
    }
    public Connection connectDB(){
        Properties dbConfig=new Properties();
      try{
          String ABSOLUTE_PATH = "C:/Users/TechLine/Desktop/inventory-management-system-main/src/main/resources/application.properties";
          InputStream input = new FileInputStream(ABSOLUTE_PATH);
          dbConfig.load(input);
          Class.forName(dbConfig.getProperty("javafx.jdbc.driver"));
          return DriverManager.getConnection(dbConfig.getProperty("jdbc.url"),dbConfig.getProperty("jdbc.username"), dbConfig.getProperty("jdbc.password"));
      }catch (Exception exception){
        exception.printStackTrace();
      }
      return null;
    }
}
