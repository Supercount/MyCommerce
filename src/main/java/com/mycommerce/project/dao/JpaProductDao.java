package com.mycommerce.project.dao;


import com.mycommerce.project.dao.base.ProductDao;
import com.mycommerce.project.model.Product;
import com.mycommerce.project.utils.PersistanceManager;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

class JpaProductDao implements ProductDao {

    private static List<Product> products = new ArrayList();
    private static Long idSequence = 1L;

    JpaProductDao() {
    }

    @Override
    public Long addElement(Product product) {
        EntityManagerFactory emf = PersistanceManager.getEmf();
        EntityManager em = null;
        EntityTransaction transaction = null;
        try {
            em = emf.createEntityManager();
            transaction = em.getTransaction();
            transaction.begin();
            em.persist(product);
            transaction.commit();
        } catch(Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            if (em != null) {
                em.close();
            }
        }
        return 1L;
    }

    @Override
    public void updateElement(Product product) {
        EntityManagerFactory emf = PersistanceManager.getEmf();
        EntityManager em = null;
        EntityTransaction transaction = null;
        try {
            em = emf.createEntityManager();
            transaction = em.getTransaction();
            transaction.begin();

            em.merge(product);

            transaction.commit();

        } catch(Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public Product findElementById(Long id) {
        EntityManagerFactory emf = PersistanceManager.getEmf();
        EntityManager em = null;
        Product product = null;
        try {
            em = emf.createEntityManager();
            Query query = em.createQuery("from Product where id = :id");
            query.setParameter("id", id);
            product = (Product) query.getSingleResult();

        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if (em != null) {
                em.close();
            }
        }
        return product;
    }

    @Override
    public List<Product> getAllElements() {
        EntityManagerFactory emf = PersistanceManager.getEmf();
        EntityManager em = null;
        List<Product> products = new ArrayList<>();
        try {
            em = emf.createEntityManager();
            Query query = em.createQuery("from Product ");
            products = (List<Product>) query.getResultList();

        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if (em != null) {
                em.close();
            }
        }
        return products;
    }

    @Override
    public void removeElement(Product product) {
        EntityManagerFactory emf = PersistanceManager.getEmf();
        EntityManager em = null;
        EntityTransaction transaction = null;
        try {
            em = emf.createEntityManager();
            transaction = em.getTransaction();
            transaction.begin();

            em.remove(product);

            transaction.commit();

        } catch(Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public void removeElement(Long val) {
        EntityManagerFactory emf = PersistanceManager.getEmf();
        EntityManager em = null;
        EntityTransaction transaction = null;
        try {
            em = emf.createEntityManager();
            Query query = em.createQuery("from Product where id = :id");
            query.setParameter("id", val);
            Product product = (Product) query.getSingleResult();
            transaction = em.getTransaction();
            transaction.begin();

            em.remove(product);

            transaction.commit();

        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    private int getProductIndexById(Long id) {
        for (int i = 0; i < products.size(); ++i) {
            Product product = products.get(i);
            if (product.getId().equals(id)) {
                return i;
            }
        }

        return -1;
    }
}
