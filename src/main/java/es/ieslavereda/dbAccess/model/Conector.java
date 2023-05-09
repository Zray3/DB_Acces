package es.ieslavereda.dbAccess.model;

import com.mysql.cj.jdbc.MysqlDataSource;
import oracle.jdbc.pool.OracleDataSource;

import javax.sql.DataSource;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Properties;

public class Conector {

    public static DataSource getMySQLDataSource(){
        Properties properties = new Properties();

        MysqlDataSource mysqlDS = null;
        try(FileInputStream fis = new FileInputStream("db.properties");){
            properties.load(fis);
            mysqlDS = new MysqlDataSource();
            mysqlDS.setURL(properties.getProperty("MYSQL_DB_URL"));
            mysqlDS.setUser(properties.getProperty("MYSQL_DB_USERNAME"));
            mysqlDS.setPassword(properties.getProperty("MYSQL_DB_PASSWORD"));

        } catch (IOException e){
            e.printStackTrace();
        }
        return mysqlDS;
    }

    public static DataSource getMyOracleDataSource(){
        Properties properties = new Properties();
        OracleDataSource oracleDS = null;

        try(FileInputStream fis = new FileInputStream("db.properties");){
            properties.load(fis);
            oracleDS = new OracleDataSource();
            oracleDS.setURL(properties.getProperty("ORACLE_DB_URL"));
            oracleDS.setUser(properties.getProperty("ORACLE_DB_USERNAME"));
            oracleDS.setPassword(properties.getProperty("ORACLE_DB_PASSWORD"));

        } catch (IOException e){
            e.printStackTrace();
        } catch (SQLException e){
            e.printStackTrace();
        }
        return oracleDS;
    }
}
