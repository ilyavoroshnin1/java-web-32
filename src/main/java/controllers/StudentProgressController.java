package controllers;

import database.DBServices;
import entity.Ocenka;
import entity.Student;
import entity.Term;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentProgressController", urlPatterns = "/student-progress")
public class StudentProgressController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStudent = req.getParameter("idStudentProgress");
        DBServices services = new DBServices();

        Student student = services.getStudentById(idStudent);
        req.setAttribute("student", student);

        List <Term> terms = services.getAllActiveTerms();
        req.setAttribute("terms", terms);

        String idSelectedTerm = req.getParameter("idSelectedTerm");

        if (idSelectedTerm == null) {
            if(terms.size() != 0) {
                Term selectedTerm = terms.get(0);
                req.setAttribute("selectedTerm", selectedTerm);
                List <Ocenka> ocenkas = services.getOcenkas(idStudent, selectedTerm.getId() + "");
                req.setAttribute("ocenkas", ocenkas);
            }
        } else {
            Term selectedTerm = services.getTermById(idSelectedTerm);
            req.setAttribute("selectedTerm", selectedTerm);
            List <Ocenka> ocenkas = services.getOcenkas(idStudent, selectedTerm.getId() + "");
            req.setAttribute("ocenkas", ocenkas);
        }

        req.getRequestDispatcher("WEB-INF/student-progress.jsp").forward(req, resp);
    }
}
