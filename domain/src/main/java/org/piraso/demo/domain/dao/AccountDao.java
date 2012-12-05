package org.piraso.demo.domain.dao;

import org.piraso.core.dao.BaseDao;
import org.piraso.demo.domain.entity.Account;
import org.piraso.demo.domain.entity.AccountStatus;

import java.util.List;

public interface AccountDao extends BaseDao<Account> {

    List<Account> getSessionAccounts(String sessionId);

    int changeStatus(String sessionId, List<String> names, AccountStatus status);

    int delete(final String sessionId, final List<String> names);
}
