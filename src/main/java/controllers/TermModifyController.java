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

@WebServlet (name = "TermModifyController", urlPatterns = "/term-modify")
public class TermModifyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("idSelectedTermToModify");
        DBServices services = new DBServices();
        Term term = services.getTermById(id);
        List<Discipline> allDisciplines = services.getAllActiveDisciplines();
        String disciplinesByTerm = "";
        for (Discipline d: services.getDisciplinesByTerm(id)) {
            disciplinesByTerm += d.getDiscipline() + ",";
        }
        req.setAttribute("term", term);
        req.setAttribute("allDisciplines", allDisciplines);
        req.setAttribute("disciplinesByTerm", disciplinesByTerm);
        req.getRequestDispatcher("WEB-INF/term-modify.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("idTermModifying");
        String duration = req.getParameter("newDuration");
        String idsDisciplines = req.getParameter("newIdsDisciplines");
        DBServices database = new DBServices();
        if (duration == null || duration.equals("") || idsDisciplines == null || idsDisciplines.equals("")) {
            req.setAttribute("Error", 1);
            Term termToModify = database.getTermById(id);
            List<Discipline> allDisciplines = database.getAllActiveDisciplines();
            String disciplinesByTerm = "";
            for (Discipline d: database.getDisciplinesByTerm(id)) {
                disciplinesByTerm += d.getDiscipline() + ",";
            }
            req.setAttribute("idSelectedTermToModify", termToModify);
            req.setAttribute("allDisciplines", allDisciplines);
            req.setAttribute("disciplinesByTerm", disciplinesByTerm);
            req.getRequestDispatcher("WEB-INF/term-modify.jsp").forward(req, resp);
            return;
        }
        database.modifyTerm(id, duration, idsDisciplines);
        resp.sendRedirect("/terms");
    }
}
