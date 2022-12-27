package controllers;

import database.DBServices;
import entity.Discipline;
import entity.Term;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TermController", urlPatterns = "/terms")
public class TermController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // здесь выводим
        // 1 - список всех активных семестров
        // 2 - понять: какой семестр выбран пользователем и передать на отображение
        // 3 - вытянуть дисциплины выбранного семестра

        // 1
        DBServices services = new DBServices();
        List<Term> terms = services.getAllActiveTerms();
        req.setAttribute("terms", terms);

        // 2
        String idSelectedTerm = req.getParameter("idSelectedTerm"); // создали переменную для параметра, который появится при нажатии кнопки "выбрать" семестр
        if (idSelectedTerm == null){ // если "idSelectedTerm" не установлен, на кнопку "выбрать" никто не нажимал и просто переход на "/terms"
            if (terms.size() != 0){ // проверка размера коллекции, чтобы не равнялась нулю
                Term selectedTerm = terms.get(0); // семестр не выбран, нет ошибки в базе и администратор не удалил все семестры, тогда выбирается автоматом 1й семестр
                req.setAttribute("selectedTerm", selectedTerm); // установили обязательные аттрибуты

                List<Discipline> disciplines = services.getDisciplinesByTerm(selectedTerm.getId() + "");  // когда выбран семестр, подтягиваются предметы
                req.setAttribute("disciplines", disciplines); // как только достали, отобразили в форме атрибута
            }
        } else {
            Term selectedTerm = services.getTermById(idSelectedTerm); // если был выбран семестр
            req.setAttribute("selectedTerm", selectedTerm); // достали его с базы и установили

            List<Discipline> disciplines = services.getDisciplinesByTerm(selectedTerm.getId() + "");
            req.setAttribute("disciplines", disciplines);
        }
        req.getRequestDispatcher("WEB-INF/terms-list.jsp").forward(req, resp);
    }
}
