package auth.permission;

import java.util.Map;

import javax.persistence.Cache;
import javax.persistence.EntityGraph;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnitUtil;
import javax.persistence.Query;
import javax.persistence.SynchronizationType;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.metamodel.Metamodel;

public class TenantEntityManagerFactory implements EntityManagerFactory {

	private final EntityManagerFactory delegate;
	public static ThreadLocal<String> TENANT = new ThreadLocal<>();

	public TenantEntityManagerFactory(EntityManagerFactory delegate) {
		this.delegate = delegate;
	}

	@Override
	public EntityManager createEntityManager() {
		EntityManager em = this.delegate.createEntityManager();
		em.setProperty("tenant", TENANT.get());
		return em;
	}

	@Override
	public EntityManager createEntityManager(Map map) {
		map.put("tenant", TENANT.get());
		return this.delegate.createEntityManager(map);
	}

	@Override
	public EntityManager createEntityManager(SynchronizationType synchronizationType) {
		return this.delegate.createEntityManager(synchronizationType);
	}

	@Override
	public EntityManager createEntityManager(SynchronizationType synchronizationType, Map map) {
		return this.delegate.createEntityManager(synchronizationType, map);
	}

	@Override
	public CriteriaBuilder getCriteriaBuilder() {
		return this.delegate.getCriteriaBuilder();
	}

	@Override
	public Metamodel getMetamodel() {
		return this.delegate.getMetamodel();
	}

	@Override
	public boolean isOpen() {
		return this.delegate.isOpen();
	}

	@Override
	public void close() {
		this.delegate.close();
	}

	@Override
	public Map<String, Object> getProperties() {
		return this.delegate.getProperties();
	}

	@Override
	public Cache getCache() {
		return this.delegate.getCache();
	}

	@Override
	public PersistenceUnitUtil getPersistenceUnitUtil() {
		return this.delegate.getPersistenceUnitUtil();
	}

	@Override
	public void addNamedQuery(String name, Query query) {
		this.delegate.addNamedQuery(name, query);
	}

	@Override
	public <T> T unwrap(Class<T> cls) {
		return this.delegate.unwrap(cls);
	}

	@Override
	public <T> void addNamedEntityGraph(String graphName, EntityGraph<T> entityGraph) {
		this.delegate.addNamedEntityGraph(graphName, entityGraph);
	}

}
