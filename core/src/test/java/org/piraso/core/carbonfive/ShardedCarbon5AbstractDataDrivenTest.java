package org.piraso.core.carbonfive;

import org.piraso.core.dbmigrator.ShardProvider;
import org.piraso.core.dbmigrator.ShardedDataSourceSelector;
import org.dbunit.DatabaseUnitException;
import org.dbunit.database.DatabaseConnection;
import org.dbunit.database.IDatabaseConnection;
import org.junit.runner.RunWith;
import org.piraso.core.dbmigrator.ShardProvider;
import org.piraso.core.dbmigrator.ShardedDataSourceSelector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Connection;


@RunWith(SpringJUnit4ClassRunner.class)
@TransactionConfiguration(transactionManager = "carbonFiveTransactionManager", defaultRollback = true)
@Transactional(rollbackFor = Exception.class)
public abstract class ShardedCarbon5AbstractDataDrivenTest extends Carbon5AbstractDataDrivenTest {

    @Autowired
    private ShardProvider shardProvider;

    @Autowired
    private ShardedDataSourceSelector dataSourceSelector;

    protected void setupDbUnitData() throws DatabaseUnitException, Exception {
        for (Integer shardID : shardProvider.getShardIDs()) {
            dataSourceSelector.switchShard(shardID);
            Connection conn = DataSourceUtils.getConnection(jdbcTemplate.getDataSource());
            IDatabaseConnection dbUnitConn = new DatabaseConnection(conn, dataSourceSelector.getSchema(shardID));

            populateData(dbUnitConn);

            DataSourceUtils.releaseConnection(conn, jdbcTemplate.getDataSource());
        }
    }
}