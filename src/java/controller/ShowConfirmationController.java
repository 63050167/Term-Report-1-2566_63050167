/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Products;
import model.Shoppingcart;
import model.ShoppingcartPK;
import model.ShoppingcartTable;
import static model.ShoppingcartTable.insertShoppingCart;
import utilities.ShoppingManager;

/**
 *
 * @author pisut
 */
public class ShowConfirmationController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        int totalPrice = (int) session.getAttribute("totalPrice");
        if (session.getAttribute("total") != null) {
            totalPrice = (int) session.getAttribute("totalPrice");
        }

        int allPrice = (Integer) session.getAttribute("totalPrice");
        List<Products> products = (List<Products>) session.getAttribute("productlist");
        List<Integer> quantities = (List<Integer>) session.getAttribute("quantities");

        List<Shoppingcart> shoppingcarts = ShoppingcartTable.findAllShoppingCart();
        int newCartId = 0;
        if (shoppingcarts.isEmpty()) {
            newCartId = 1;
        } else {
            newCartId = shoppingcarts.get(shoppingcarts.size() - 1).getShoppingcartPK().getCartId() + 1;
        }

        for (int i = 0; i < products.size(); i++) {
            ShoppingcartPK shoppingcartPK = new ShoppingcartPK();
            shoppingcartPK.setCartId(newCartId);
            shoppingcartPK.setMovieId(products.get(i).getId());

            Shoppingcart cart = new Shoppingcart();
            cart.setShoppingcartPK(shoppingcartPK);
            cart.setQuantity(quantities.get(i));
            insertShoppingCart(cart);
        }

        request.setAttribute("totalPrice", totalPrice);

        int cartId = (int) session.getAttribute("cartId");
        synchronized (this.getServletContext()) {
            ShoppingManager.finishShopping(this.getServletContext(), cartId);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/ShowConfirm.jsp");
        dispatcher.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
