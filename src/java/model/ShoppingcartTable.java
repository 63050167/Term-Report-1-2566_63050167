/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author pisut
 */
public class ShoppingcartTable {

    public static void insertShoppingCart(Shoppingcart cart) {
        EntityManager em = Persistence.createEntityManagerFactory("OnlineShoppingPU").createEntityManager();
        em.getTransaction().begin();
        em.persist(cart);
        em.getTransaction().commit();
        em.close();
    }

    public static List<Shoppingcart> findAllShoppingCart() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineShoppingPU");
        EntityManager em = emf.createEntityManager();
        List<Shoppingcart> empList = null;
        try {
            empList = (List<Shoppingcart>) em.createNamedQuery("Shoppingcart.findAll").getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);

        } finally {
            em.close();
            emf.close();
        }
        return empList;
    }
}
