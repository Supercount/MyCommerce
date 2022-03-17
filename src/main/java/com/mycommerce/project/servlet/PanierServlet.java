package com.mycommerce.project.servlet;

import com.mycommerce.project.dao.DaoFactory;
import com.mycommerce.project.dao.base.ProductDao;
import com.mycommerce.project.model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = PanierServlet.URL)
public class PanierServlet extends HttpServlet {

    public static final String URL = "/auth/panier";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        List<Product> panier = (List<Product>) session.getAttribute("panier");
        req.setAttribute("panier",panier);

        RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/panier.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String productIdStr = req.getParameter("pId");

        Long id = Long.parseLong(productIdStr);
        ProductDao productDao = DaoFactory.getProductDao();
        Product product = productDao.findElementById(id);

        HttpSession session = req.getSession();

        List<Product> panier = (List<Product>) session.getAttribute("panier");


        if (panier == null) {
            panier = new ArrayList<>();
        }

        panier.add(product);

        session.setAttribute("panier",panier);

        RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/panier.jsp");
        rd.forward(req, resp);
    }
}
