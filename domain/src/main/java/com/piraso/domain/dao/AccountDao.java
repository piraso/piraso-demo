package com.piraso.domain.dao;

import com.piraso.core.dao.BaseDao;
import com.piraso.domain.entity.Account;
import com.piraso.domain.entity.AccountStatus;

import java.util.List;

public interface AccountDao extends BaseDao<Account> {

    List<Account> getSessionAccounts(String sessionId);

    int changeStatus(String sessionId, List<String> names, AccountStatus status);

    int delete(final String sessionId, final List<String> names);
}
