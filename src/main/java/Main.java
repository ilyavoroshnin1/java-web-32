import database.DBServices;
import entity.Discipline;

import java.sql.*;
import java.util.List;

public class Main {
    public static void main(String[] args) {

        DBServices services = new DBServices();
        List<Discipline> disciplines = services.getAllActiveDisciplines();
        System.out.println();


//        try{
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/students_32", "root", "Lfgmhal144@");
//            Statement stmt = conn.createStatement();
//            ResultSet rs = stmt.executeQuery("select * from discipline where status = '1'");
//
//            while (rs.next()){
//                System.out.println(rs.getString("discipline"));
//            }
//        } catch (Exception e){
//            e.printStackTrace();
//
//        }


//        DBServices services = new DBServices();
//        services.createDiscipline("Программирование");
    }
}


// 24 урок
// 1 - 39:00 объяснение строчки. очень сложно
// 2 - создали стейтмент
// 3 - 50:00 создаем запрос в MySQL и здесь, сложно
