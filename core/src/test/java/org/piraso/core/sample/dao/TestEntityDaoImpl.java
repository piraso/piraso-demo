package org.piraso.core.sample.dao;

import org.piraso.core.dao.BaseDaoImpl;
import org.piraso.core.sample.beans.TestEntity;
import org.piraso.core.dao.BaseDaoImpl;

/**
 * Dao for {@link TestEntity} class.
 */
public class TestEntityDaoImpl extends BaseDaoImpl<TestEntity> implements TestEntityDao {
    public TestEntityDaoImpl() {
        super(TestEntity.class);
    }
}
