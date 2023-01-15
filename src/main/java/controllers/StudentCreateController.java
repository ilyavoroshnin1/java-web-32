package controllers;

import database.DBServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

@WebServlet(name = "StudentCreateController", urlPatterns = "/student-create")
public class StudentCreateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/student-create.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String surname = req.getParameter("surname"); //вытягиваем из "student-create" то, что польз. введет в 4е графы
        String name = req.getParameter("name");
        String group = req.getParameter("group");
        String date = req.getParameter("date");
        if (surname == null || surname.equals("") || name == null || name.equals("") || group == null || group.equals("") || date == null || date.equals("")){
            req.setAttribute("Error", "1");
            req.getRequestDispatcher("WEB-INF/student-create.jsp").forward(req, resp);
            return;
        }
        DBServices dataBase = new DBServices();

        // String To Date - будет преобразование из стринга в дату
        DateFormat format = new SimpleDateFormat("dd/MM/yyyy", Locale.ENGLISH);
        Date dateFromUser;
        try {
            dateFromUser = format.parse(date);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        // Date to String - теперь преобразуем обратно стринг в дату
        Format formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateToDataBase = formatter.format(dateFromUser);

        dataBase.createStudent(surname, name, group, dateToDataBase); // отправляем в БД на сохранение
        resp.sendRedirect("/students"); // перенаправление на контроллер! а не на страницу
    }
}
