package controllers;

import database.DBServices;
import entity.Discipline;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TermCreateController", urlPatterns = "/term-create")
public class TermCreateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DBServices services = new DBServices();
        List<Discipline> allDisciplines = services.getAllActiveDisciplines();
        req.setAttribute("allDisciplines", allDisciplines);
        req.getRequestDispatcher("WEB-INF/term-create.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DBServices database = new DBServices();
        String duration = req.getParameter("duration");
        String idDisciplinesToNewTerm = req.getParameter("idsDisciplines");
        if (duration == null || duration.equals("") || idDisciplinesToNewTerm == null || idDisciplinesToNewTerm.equals("")) {
            req.setAttribute("Error", 1);
            List<Discipline> allDisciplines = database.getAllActiveDisciplines();
            req.setAttribute("allDisciplines", allDisciplines);
            req.getRequestDispatcher("WEB-INF/term-create.jsp").forward(req, resp);
            return;
        }
        database.createTerm(duration, idDisciplinesToNewTerm);
        resp.sendRedirect("/terms");
    }
}
