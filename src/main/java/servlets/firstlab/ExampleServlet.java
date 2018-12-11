package servlets.firstlab;

import controller.SeidelMethod;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/seidelExample")
public class ExampleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        firstLabExample(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        firstLabExample(req, resp);
    }


    private void firstLabExample(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        double[][] matrix = {
                {15, 3, -5, -5},
                {7, -15, -6, 1},
                {-4, 7, 19, 6},
                {3, 0, -5, 8}
        };
        double[] b = {36, -112, 19, -23};

        SeidelMethod seidelMethod = new SeidelMethod(matrix, b);
        req.getSession().setAttribute("matrix", matrix);
        req.getSession().setAttribute("b", b);
        req.getSession().setAttribute("answer",seidelMethod.solve());
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("jsp/answerViewer.jsp");
        requestDispatcher.forward(req, resp);
    }
}
