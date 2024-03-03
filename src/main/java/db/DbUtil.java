package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbUtil {
    private static String url = "jdbc:mysql://localhost:3306/project?useUnicode=true&serverTimezone=Asia/Seoul";
    private static String id = "root";
    private static String pw = "76065633";

    static{
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("드라이버 로딩 완료");
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    private DbUtil() {

    }
    public static Connection getCon() throws SQLException{
        Connection con = DriverManager.getConnection(url, id ,pw);
        return con;
    }
}
