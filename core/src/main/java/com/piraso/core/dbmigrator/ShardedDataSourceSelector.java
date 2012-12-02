package com.piraso.core.dbmigrator;

/**
 * Sharded datasource provider
 */
public interface ShardedDataSourceSelector extends DataSourceSelector {

    /**
     * Switch the datasource to select given the shard id.
     *
     * @param id the shard id.
     */
    void switchShard(Integer id);

    /**
     * Provides the Data base schema to use.
     *
     * @param id the shard id
     * @return the database schema for the shard id
     */
    String getSchema(Integer id);
}
