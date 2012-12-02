package com.piraso.domain.common.dao;

import com.piraso.core.dao.BaseDaoImpl;
import com.piraso.domain.common.entity.Account;

public class AccountDaoImpl extends BaseDaoImpl<Account> implements AccountDao {
    public AccountDaoImpl() {
        super(Account.class);
    }
}
