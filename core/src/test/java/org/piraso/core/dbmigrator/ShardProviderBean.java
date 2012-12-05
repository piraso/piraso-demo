package org.piraso.core.dbmigrator;

import java.util.List;

/**
 * generates the shards base from codes.
 */
public class ShardProviderBean implements ShardProvider {

    private List<Integer> shardIDs;

    @Override
    public List<Integer> getShardIDs() {
        return shardIDs;
    }

    public void setShardIDs(List<Integer> shardIDs) {
        this.shardIDs = shardIDs;
    }
}
