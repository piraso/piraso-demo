package com.piraso.core.dbmigrator;

import com.carbonfive.db.migration.DataSourceMigrationManager;
import com.carbonfive.db.migration.Migration;
import com.carbonfive.db.migration.ResourceMigrationResolver;
import com.carbonfive.db.migration.SimpleVersionStrategy;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;
import java.util.SortedSet;

/**
 * Base implementation for a data source migration manager.
 *
 */
public abstract class AbstractDataSourceMigrationManager  {
    private static final Logger LOGGER = Logger.getLogger(AbstractDataSourceMigrationManager.class);

    public static final String RESOURCE_PATH_DB_MIGRATIONS = "/db/migrations/";

    public static final String SCHEMA_VERSION_TABLE = "schema_version";

    public static final String AUTO_DB_MIGRATE_NAME = "auto_db_migrate";

    protected SimpleVersionStrategy versionStrategy;

    protected ResourceMigrationResolver migrationResolver;

    protected DataSourceSelector dataSourceSelector;

    protected String domain;

    protected boolean testContext;

    @Required
    public void setTestContext(boolean testContext) {
        this.testContext = testContext;
    }

    @Required
    public void setVersionStrategy(SimpleVersionStrategy versionStrategy) {
        this.versionStrategy = versionStrategy;
    }

    @Required
    public void setDataSourceSelector(DataSourceSelector dataSourceSelector) {
        this.dataSourceSelector = dataSourceSelector;
    }

    @Required
    public void setDomain(String domain) {
        this.domain = domain;
        versionStrategy.setVersionTable(domain + "_" + SCHEMA_VERSION_TABLE);
        migrationResolver.setMigrationsLocation("classpath:" + RESOURCE_PATH_DB_MIGRATIONS + domain);
    }

    @Required
    public void setMigrationResolver(ResourceMigrationResolver migrationResolver) {
        this.migrationResolver = migrationResolver;
    }

    /**
     * Start with migration.
     */
    public abstract void migrate();

    protected void migrateForDataSource(DataSource dataSource) {
        migrateForDataSource(dataSource, false);
    }

    protected void migrateForDataSource(DataSource dataSource, boolean force) {
        DataSourceMigrationManager manager = new DataSourceMigrationManager(dataSource);
        manager.setMigrationResolver(migrationResolver);
        manager.setVersionStrategy(versionStrategy);

        if (testContext) {
            LOGGER.info("isTestContext() returned True. About to run carbon5 migrations for domain: " + this.domain);
            manager.migrate();
        } else if (mayAutoMigrate()) {
            LOGGER.info("mayAutoMigrate() returned True. About to run carbon5 migrations for domain: " + this.domain);
            manager.migrate();
        } else if(force) {
            LOGGER.info("forced migration. About to run carbon5 migrations for domain: " + this.domain);
            manager.migrate();
        } else {
            LOGGER.info("mayAutoMigrate() returned False. Not running migrations for domain: " + this.domain);
            SortedSet<Migration> pending = manager.pendingMigrations();

            if(pending.size() != 0) {
                String fileName = new MigrationScriptBuilder()
                        .setDomain(domain)
                        .setMigrations(pending)
                        .build();

                showingPendingMigrations(pending, fileName);

                throw new IllegalStateException("Database schema is not up-to-date for domain: " + this.domain);
            }
        }
    }

    protected boolean mayAutoMigrate() {
        try {
            JdbcTemplate template = new JdbcTemplate(dataSourceSelector.getDataSource());
            String s = (String) template.queryForObject("select value from ops.env where name='" + AUTO_DB_MIGRATE_NAME + "'", String.class);

            return Boolean.parseBoolean(s);
        } catch (IncorrectResultSizeDataAccessException e) {
            // There is no row for the AUTO_DB_MIGRATE property. We assume the worst
            // and don't execute any migrations.
            LOGGER.warn("ops.env is not setup to automigrate , the " + AUTO_DB_MIGRATE_NAME + " property is not set. returning false ", e);

            return false;
        } catch (Exception e) {
            // Any exception we assume the worst and don't want to run any miugrations automatically.
            LOGGER.warn("Failed to determine " + AUTO_DB_MIGRATE_NAME + " , assuming the worst and returning false.", e);

            return false;
        }
    }

    /*
    * Method that shows the files that need to be executed to bring the schema up-to-date
    */
    protected void showingPendingMigrations(SortedSet<Migration> pending, String fileName) {
        System.err.println("------------------------------------------------------------------------------------------------------");
        System.err.println("                                                                                                      ");
        System.err.println("The following migrations have to be run in " + domain + " domain to bring database schema in sync with the deployed code");
        System.err.println("                                                                                                      ");
        for (Migration migration : pending) {
            System.err.println(migration.getFilename());
        }
        System.err.println("                                                                                                      ");
        System.err.println("The contents of the above migration script(s) is now in " + fileName + " . " );
        System.err.println("Please run it to get the database back in sync" );
        System.err.println("------------------------------------------------------------------------------------------------------");
        System.err.flush();
    }
}
