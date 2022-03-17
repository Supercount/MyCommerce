package com.mycommerce.project.dao;


import com.mycommerce.project.dao.base.CategoryDao;
import com.mycommerce.project.model.Category;
import com.mycommerce.project.utils.PersistanceManager;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

class JpaCategoryDao implements CategoryDao {

    private static List<Category> categories = new ArrayList();
    private static Integer idSequence = 1;

    JpaCategoryDao() {
    }

    @Override
    public Integer addElement(Category category) {
        EntityManagerFactory emf = PersistanceManager.getEmf();
        EntityManager em = null;
        EntityTransaction transaction = null;
        //Integer var1 = idSequence;
        //idSequence = idSequence + 1;
        //category.setId(var1);
        try {
            em = emf.createEntityManager();
            transaction = em.getTransaction();
            transaction.begin();
            em.persist(category);
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
        return 1;
        //return var1;
    }

    @Override
    public void updateElement(Category category) {
        EntityManagerFactory emf = PersistanceManager.getEmf();
        EntityManager em = null;
        EntityTransaction transaction = null;
        try {
            em = emf.createEntityManager();
            transaction = em.getTransaction();
            transaction.begin();

            em.merge(category);

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
    public Category findElementById(Integer id) {
        EntityManagerFactory emf = PersistanceManager.getEmf();
        EntityManager em = null;
        Category category = null;
        try {
            em = emf.createEntityManager();
            Query query = em.createQuery("from Category where id = :id");
            query.setParameter("id", id);
            category = (Category) query.getSingleResult();

        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if (em != null) {
                em.close();
            }
        }
        return category;
    }

    @Override
    public List<Category> getAllElements() {
        EntityManagerFactory emf = PersistanceManager.getEmf();
        EntityManager em = null;
        List<Category> categories = new ArrayList<>();
        try {
            em = emf.createEntityManager();
            Query query = em.createQuery("from Category ");
            categories = (List<Category>) query.getResultList();

        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if (em != null) {
                em.close();
            }
        }
        return categories;
    }

    @Override
    public void removeElement(Category category) {
        EntityManagerFactory emf = PersistanceManager.getEmf();
        EntityManager em = null;
        EntityTransaction transaction = null;
        try {
            em = emf.createEntityManager();
            transaction = em.getTransaction();
            transaction.begin();

            em.remove(category);

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
    public void removeElement(Integer val) {
        EntityManagerFactory emf = PersistanceManager.getEmf();
        EntityManager em = null;
        EntityTransaction transaction = null;
        try {
            em = emf.createEntityManager();
            Query query = em.createQuery("from Category where id = :id");
            query.setParameter("id", val);
            Category category = (Category) query.getSingleResult();
            transaction = em.getTransaction();
            transaction.begin();

            em.remove(category);

            transaction.commit();

        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    private int getCategoryIndexById(Integer id) {
        for (int i = 0; i < categories.size(); ++i) {
            Category category = categories.get(i);
            if (category.getId().equals(id)) {
                return i;
            }
        }

        return -1;
    }
}
