package com.piraso.domain.dao;

import com.piraso.core.dao.BaseDao;
import com.piraso.domain.entity.Account;

import java.util.List;

public interface AccountDao extends BaseDao<Account> {

    List<Account> getSessionAccounts(String sessionId);
}
