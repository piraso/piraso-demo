package com.piraso.core.dbmigrator;

import org.apache.commons.lang.Validate;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Required;

/**
 * This db .
 */
public class ShardedDataSourceMigrationManager extends AbstractDataSourceMigrationManager {

    private static final Logger LOGGER = Logger.getLogger(ShardedDataSourceMigrationManager.class);

    private ShardProvider shardProvider;

    @Required
    public void setShardProvider(ShardProvider shardProvider) {
        this.shardProvider = shardProvider;
    }

    @Required
    @Override
    public void setDataSourceSelector(DataSourceSelector dataSourceSelector) {
        Validate.isTrue(ShardedDataSourceSelector.class.isInstance(dataSourceSelector), "DataSource selector should be of ShardedDataSourceSelector instance.");
        super.setDataSourceSelector(dataSourceSelector);
    }

    public ShardedDataSourceSelector getShardedDataSourceSelector() {
        return (ShardedDataSourceSelector) dataSourceSelector;
    }

    @Override
    public void migrate() {
        for(Integer shardId : shardProvider.getShardIDs()) {
            migrateShard(shardId);
        }
    }
    
    public void migrateShard(Integer shardId) {
        LOGGER.info(String.format("Migrating for shardId '%d'.", shardId));
        migrateShard(shardId, false);
    }

    public void forceMigrateShard(Integer shardId) {
        LOGGER.info(String.format("Force migrating for shardId '%d'.", shardId));
        migrateShard(shardId, true);
    }

    public void migrateShard(Integer shardId, boolean force) {
        LOGGER.info(String.format("Migrating for shardId '%d'.", shardId));
        ShardedDataSourceSelector selector = getShardedDataSourceSelector();
        selector.switchShard(shardId);
        migrateForDataSource(selector.getDataSource(), force);
    }


}
