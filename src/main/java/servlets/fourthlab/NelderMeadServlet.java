package servlets.fourthlab;

import controller.NelderMeadMethod;
import model.NelderMeadAnswer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/nelderMead")
public class NelderMeadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        NelderMeadMethod nelderMeadMethod = new NelderMeadMethod();
        NelderMeadAnswer answer = nelderMeadMethod.solve();
        req.getSession().setAttribute("nelderMeadX", answer.x());
        req.getSession().setAttribute("nelderMeadY", answer.y());
        req.getSession().setAttribute("nelderMeadFunction", answer.f());
        req.getSession().setAttribute("nelderMeadAmountOfIterations", answer.amountOfIterations());
        req.getRequestDispatcher("jsp/nelderMeadMethod.jsp").forward(req, resp);
    }
}
