package servlets.thirdlab;

import controller.EulerMethod;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/euler")
public class EulerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("jsp/eulerMethod.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EulerMethod eulerMethod = new EulerMethod(Double.parseDouble(req.getParameter("h")));
        req.getSession().setAttribute("eulerMethodX", eulerMethod.solve().x());
        req.getSession().setAttribute("eulerMethodY", eulerMethod.solve().y());
        System.out.println(eulerMethod.solve().x());
        doGet(req, resp);
    }
}
