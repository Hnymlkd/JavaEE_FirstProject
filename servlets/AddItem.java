package servlets;

import db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet(value = "/addItem")
public class AddItem extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("addItem.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        if (description == null || description.trim().isEmpty()) {
            description = "Нет";
        }
        String deadlineDate = req.getParameter("deadline");
        Item item = new Item();
        item.setName(name);
        item.setDescription(description);
        item.setDeadlineDate(deadlineDate);
        DBManager.addItem(item);
        resp.sendRedirect("/task1");
    }
}
