package servlets.secondlab;

import controller.MidpointRule;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/midPoint")
public class MidPointServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("jsp/midPoint.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int n = Integer.parseInt(req.getParameter("n"));
        double a = Double.parseDouble(req.getParameter("a"));
        double b = Double.parseDouble(req.getParameter("b"));

        if (a > b) {
            req.getSession().invalidate();
            resp.sendRedirect("jsp/error/error.jsp");
        } else {
            MidpointRule midpointRule = new MidpointRule(a, b, n);
            req.getSession().setAttribute("midPoint", midpointRule.solve());
            doGet(req, resp);
        }
    }
}
