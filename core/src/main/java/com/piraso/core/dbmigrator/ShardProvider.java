package com.piraso.core.dbmigrator;

import java.util.List;

/**
 * Defines an interface for providing shards.
 */
public interface ShardProvider {

    /**
     * Provides all the shard ids.
     *
     * @return provides all the shard ids.
     */
    public List<Integer> getShardIDs();
}
