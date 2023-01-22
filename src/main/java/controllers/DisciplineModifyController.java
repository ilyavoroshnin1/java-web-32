package controllers;

import database.DBServices;
import entity.Discipline;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DisciplineModifyController", urlPatterns = "/discipline-modify")
public class DisciplineModifyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("hiddenModifyDiscipline");
        DBServices services = new DBServices();
        Discipline discipline = services.getDisciplineById(id);

        req.setAttribute("discipline", discipline);
        req.getRequestDispatcher("WEB-INF/discipline-modify.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("idDiscipline");
        String discipline = req.getParameter("discipline");
        DBServices database = new DBServices();
        if (discipline == null || discipline.equals("")) {
            req.setAttribute("Error", 1);
            Discipline disciplineToModify = database.getDisciplineById(id);
            req.setAttribute("discipline", disciplineToModify);
            req.getRequestDispatcher("WEB-INF/discipline-modify.jsp").forward(req, resp);
            return;
        }
        database.modifyDiscipline(id, discipline);
        resp.sendRedirect("/disciplines");
    }
}
