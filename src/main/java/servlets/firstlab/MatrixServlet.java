package servlets.firstlab;

import controller.SeidelMethod;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "matrix", urlPatterns = "/matrix")
public class MatrixServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("jsp/matrix.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int amountOfRows = Integer.parseInt(req.getSession().getAttribute("amountOfRows").toString());
        double[][] matrix = new double[amountOfRows][amountOfRows];
        double[] b = new double[amountOfRows];
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix.length; j++) {
                String str = String.valueOf(i) + String.valueOf(j);
                matrix[i][j] = Double.parseDouble(req.getParameter(str));
            }
            b[i] = Double.parseDouble(req.getParameter("b" + i));
        }

        HttpSession session = req.getSession();
        session.setAttribute("matrix", matrix);
        session.setAttribute("b", b);
        if (session.getAttribute("eps") != null) {
            double eps = (double) session.getAttribute("eps");
            session.setAttribute("answer", new SeidelMethod(matrix, b, eps).solve());
        } else {
            session.setAttribute("answer", new SeidelMethod(matrix, b).solve());
        }
        req.getRequestDispatcher("jsp/answerViewer.jsp").forward(req, resp);
    }
}
