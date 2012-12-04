package com.piraso.domain.service;

import com.piraso.core.carbonfive.Carbon5AbstractDataDrivenTest;
import com.piraso.domain.vo.AccountVO;
import com.piraso.domain.vo.AccountVOBuilder;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import static org.hamcrest.MatcherAssert.assertThat;
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

    @Test
    public void testAddAccount() throws Exception {
        AccountVO account = new AccountVOBuilder()
                .setName("name5")
                .setDescription("desc5")
                .setSessionID("session3")
                .build();

        service.addAccount(account);

        assertThat(service.getSessionAccounts("session3"), hasSize(1));

        account = new AccountVOBuilder()
                .setName("name6")
                .setDescription("desc6")
                .setSessionID("session3")
                .build();

        service.addAccount(account);

        assertThat(service.getSessionAccounts("session3"), hasSize(2));
    }
}
