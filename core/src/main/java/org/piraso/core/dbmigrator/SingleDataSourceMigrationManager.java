package org.piraso.core.dbmigrator;

/**
 * Default data source migration manager for a single or none sharded data source.
 */
public class SingleDataSourceMigrationManager extends AbstractDataSourceMigrationManager {

    @Override
    public void migrate() {
        migrateForDataSource(dataSourceSelector.getDataSource());
    }
}
