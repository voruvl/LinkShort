package org.link.shorter.dao;

import java.util.List;

public interface IDao<T> {

	public T findById(final Long id);

	public List<T> findAll();

	public void save(final T entity);

	public void delete(final T entity);

	public void deleteById(final Long entityId);
}