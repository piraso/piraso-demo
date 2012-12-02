package com.piraso.core.sample.dao;

import com.piraso.core.dao.BaseDaoImpl;
import com.piraso.core.sample.beans.TestEntity;

/**
 * Dao for {@link TestEntity} class.
 */
public class TestEntityDaoImpl extends BaseDaoImpl<TestEntity> implements TestEntityDao {
    public TestEntityDaoImpl() {
        super(TestEntity.class);
    }
}
