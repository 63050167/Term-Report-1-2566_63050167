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
public class ProductsTable {

    public static List<Products> findAllProduct() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineShoppingPU");
        EntityManager em = emf.createEntityManager();
        List<Products> empList = null;
        try {
            empList = (List<Products>) em.createNamedQuery("Products.findAll").getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);

        } finally {
            em.close();
            emf.close();
        }
        return empList;
    }

    public static Products findProductById(int id) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineShoppingPU");
        EntityManager em = emf.createEntityManager();
        Products emp = null;
        try {
            emp = em.find(Products.class, id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            em.close();
            //emf.close();
        }
        return emp;
    }

    public static int updateProduct(Products emp) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineShoppingPU");
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            Products target = em.find(Products.class, emp.getId());
            if (target == null) {
                return 0;
            }
            target.setMovie(emp.getMovie());
            target.setRating(emp.getRating());
            target.setYearcreate(emp.getYearcreate());
            target.setPrice(emp.getPrice());
            em.persist(target);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();

        } finally {
            em.close();
            emf.close();
        }
        return 1;

    }

    public static int removeProduct(int id) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineShoppingPU");
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            Products target = em.find(Products.class, id);
            if (target == null) {
                return 0;
            }
            em.remove(target);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();

        } finally {
            em.close();
            emf.close();
        }
        return 1;
    }

    public static int insertProduct(Products emp) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineShoppingPU");
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            Products target = em.find(Products.class, emp.getId());
            if (target != null) {
                return 0;
            }
            em.persist(emp);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();

        } finally {
            em.close();
            emf.close();
        }
        return 1;
    }
}
