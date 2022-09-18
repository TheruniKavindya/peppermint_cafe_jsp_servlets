package lk.ac.kln;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ac.kln.dao.PetFoodDao;
import lk.ac.kln.dao.PetFoodDaoImpl;
import lk.ac.kln.model.PetFood;

import java.io.IOException;
import java.util.List;

public class PetFoodController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PetFoodDao petFoodDao = new PetFoodDaoImpl();
        List<PetFood> petFoods = petFoodDao.getAllFood();
        req.setAttribute("food", petFoods);
        req.setAttribute("test", "Empty");

        System.out.println("No Pet Foods Available" + petFoods);

        RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
