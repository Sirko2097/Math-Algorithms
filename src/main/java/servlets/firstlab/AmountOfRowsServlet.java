package servlets.firstlab;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/solver")
public class AmountOfRowsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("jsp/yourVariant.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        taskSolver(req, resp);
    }

    private void taskSolver(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("amountOfRows") != null) {
            int amountOfRows = Integer.parseInt(req.getParameter("amountOfRows"));
            req.getSession().setAttribute("amountOfRows", amountOfRows);
        }
        if (!req.getParameter("eps").isEmpty()) {
            double epsilon = Double.parseDouble(req.getParameter("eps"));
            req.getSession().setAttribute("eps", epsilon);
        }

//        req.getRequestDispatcher("/matrix").forward(req, resp);
        resp.sendRedirect("/matrix");

//        sessionCreator(req, resp, matrix, b);
    }

}
