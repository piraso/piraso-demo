package com.piraso.domain.service;

import com.piraso.core.carbonfive.Carbon5AbstractDataDrivenTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.hamcrest.Matchers.hasSize;

/**
 * Test for {@link AccountManagementServiceImpl} class.
 */
@Carbon5AbstractDataDrivenTest.DataSet(locations = {"dataset/account-data-set.xml"})
@ContextConfiguration(locations = { "classpath:spring-domain-db-test.xml" })
public class AccountManagementServiceImplTest extends Carbon5AbstractDataDrivenTest {

    @Autowired
    private AccountManagementService service;

    @Test
    public void testGetSessionAccount() throws Exception {
        assertThat(service.getSessionAccounts("session1"), hasSize(2));
        assertThat(service.getSessionAccounts("session2"), hasSize(1));
    }
}
