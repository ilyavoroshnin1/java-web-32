package database;

import constants.Constants;
import entity.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DBServices implements IDBServices {
    @Override
    public List<Discipline> getAllActiveDisciplines() {
        ArrayList<Discipline> disciplines = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // начинает раб-ть менедж. драйверов (в скобках название драйвера)
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB,
                    Constants.PASSWORD_TO_DB); // соединение с БД
            Statement stmt = conn.createStatement(); // создаем стейтмент для обращения в БД
            ResultSet rs = stmt.executeQuery("select * from discipline where status = '1'"); // метод "executeQuery" выз-ся у "stmt" для получения рез-та при запросе в БД
            while (rs.next()) {
                Discipline discipline = new Discipline();
                discipline.setId(rs.getInt("id")); // "rs"- сюда сохр-ся ответ на запрос. "rs.getInt"-достаем у rs в инте значение "id"
                discipline.setDiscipline(rs.getString("discipline"));
                disciplines.add(discipline);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return disciplines;
    }

    @Override
    public void createDiscipline(String discipline) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB,
                    Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            stmt.execute("INSERT INTO `discipline` (`discipline`) VALUES ('" + discipline + "');");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Discipline getDisciplineById(String id) {
        Discipline discipline = new Discipline();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB,
                    Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from discipline where id = " + id + " and status = '1'");
            while (rs.next()) {
                discipline.setId(rs.getInt("id"));
                discipline.setDiscipline(rs.getString("discipline"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return discipline;
    }

    @Override
    public void modifyDiscipline(String id, String newDiscipline) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB,
                    Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            stmt.execute("UPDATE discipline SET discipline = " + newDiscipline + " WHERE (id = " + id + ");\n");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteDiscipline(String id) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB,
                    Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            stmt.execute("UPDATE discipline SET status = '0' WHERE (id = " + id + ");\n");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Student> getAllActiveStudent() {
        ArrayList<Student> students = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB,
                    Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from student where status = '1'");

            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getInt("id"));
                student.setSurname(rs.getString("surname"));
                student.setName(rs.getString("name"));
                student.setGroup(rs.getString("group"));
                student.setDate(rs.getDate("date"));
                students.add(student);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return students;
    }

    @Override
    public void createStudent(String newSurname, String newName, String newGroup, String newDate) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            stmt.execute("INSERT INTO `student` (`surname`,`name`,`group`,`date`) VALUES ('" + newSurname + "','" + newName + "','" + newGroup + "','" + newDate + "')");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Student getStudentById(String id) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement(); //создаем запрос
            ResultSet rs = stmt.executeQuery("select * from student where status = '1' and id = " + id);

            while (rs.next()) {//пока есть следующая строка
                Student student = new Student();
                student.setId(rs.getInt("id"));
                student.setSurname(rs.getString("surname"));
                student.setName(rs.getString("name"));
                student.setGroup(rs.getString("group"));
                student.setDate(rs.getDate("date"));
                return student;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void modifyStudent(String id, String newSurname, String newName, String newGroup, String newDate) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            stmt.execute("UPDATE `student` SET `surname` = '" + newSurname + "', `name` = '" + newName + "', `group` = '" + newGroup + "', `date` = '" + newDate + "' WHERE (`id` = '" + id + "')");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteStudent(String id) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB,
                    Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            stmt.execute("UPDATE `student` SET `status` = '0' WHERE (`id` = '" + id + "');");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Term> getAllActiveTerms() {
        ArrayList<Term> terms = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM term where status = '1'");

            while (rs.next()) {
                Term term = new Term();
                term.setId(rs.getInt("id"));
                term.setTerm(rs.getString("term"));
                term.setDuration(rs.getString("duration"));
                terms.add(term);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return terms;
    }

    @Override
    public List<Discipline> getDisciplinesByTerm(String idTerm) {
        List<Discipline> disciplines = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement(); //создаем запрос
            ResultSet rs = stmt.executeQuery("SELECT * FROM term_discipline as td\n" +
                    "left join discipline as d on td.id_discipline = d.id\n" +
                    "where d.status = '1' and td.id_term = " + idTerm);

            while (rs.next()) {
                Discipline discipline = new Discipline();
                discipline.setId(rs.getInt("id_discipline"));
                discipline.setDiscipline(rs.getString("discipline"));
                disciplines.add(discipline);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return disciplines;
    }

    @Override
    public void createTerm(String duration, String idsDisciplines) {

    }

    @Override
    public Term getTermById(String id) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM term where status = '1' and id = " + id);

            while (rs.next()) {
                Term term = new Term();
                term.setId(rs.getInt("id"));
                term.setTerm(rs.getString("term"));
                term.setDuration(rs.getString("duration"));
                return term;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void modifyTerm(String id, String newDuration, String newIdsDisciplines) {

    }

    @Override
    public List<Ocenka> getOcenkas(String idStudent, String idTerm) {
        return null;
    }

    @Override
    public List<Role> getAllActiveRoles() {
        ArrayList<Role> roles = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");//подключаем драйвер для работы с БД
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            //создаем подключение к БД (localhost - этот комп, другой комп - пишем айпи), пишем логин и пароль от MySQL
            Statement stmt = conn.createStatement(); //создаем запрос
            ResultSet rs = stmt.executeQuery("SELECT * FROM students_32.role where status = '1'");

            while (rs.next()) {
                Role role = new Role();
                role.setId(rs.getInt("id"));
                role.setRole(rs.getString("role"));
                roles.add(role);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return roles;
    }

    @Override
    public boolean canLogin(String login, String password, String idRole) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");//подключаем драйвер для работы с БД
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement(); //создаем запрос
            ResultSet rs = stmt.executeQuery("SELECT * FROM user_role as ur\n" +
                    "LEFT JOIN user as u on ur.id_user = u.id\n" +
                    "WHERE u.login = '" + login + "' and u.password = '" + password + "'and ur.id_role = " + idRole);

            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}



