package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import controller.JpaUtils;
import model.User;

public class UserDAO {

	@Override
	protected void finalize() throws Throwable {
		EntityManager em = JpaUtils.getEntityManager();
		em.close();
		super.finalize();
	}
	public void create(User user) {
		EntityManager em = JpaUtils.getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(user);
			em.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			em.getTransaction().rollback();
			throw e;
		} finally {
			em.close();
		}
	}
	public void update(User user) {
		EntityManager em = JpaUtils.getEntityManager();
		try {
			em.getTransaction().begin();
			em.merge(user);
			em.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			em.getTransaction().rollback();
			throw e;
		} finally {
			em.close();
		}
	}
	public void delete(String id) throws Exception {
		EntityManager em = JpaUtils.getEntityManager();
		try {
			em.getTransaction().begin();
			User user = em.find(User.class, id);
			em.remove(user);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			em.close();
		}
	}
	public User findById(String id) {
		EntityManager em = JpaUtils.getEntityManager();
		User entity = em.find(User.class, id);
		return entity;
	}
	public List<User> findAll() {
		EntityManager em = JpaUtils.getEntityManager();
		TypedQuery<User> query = em.createNamedQuery("User.findAll", User.class);
		return query.getResultList();
	}
	
}
