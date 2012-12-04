package com.piraso.domain.service;

import com.piraso.domain.dao.AccountDao;
import com.piraso.domain.entity.Account;
import com.piraso.domain.vo.AccountVO;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

public class AccountManagementServiceImpl implements AccountManagementService {

    private AccountDao accountDao;
    private Mapper mapper;


    @Required
    public void setMapper(Mapper mapper) {
        this.mapper = mapper;
    }

    @Required
    public void setAccountDao(AccountDao accountDao) {
        this.accountDao = accountDao;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Transactional(readOnly = true)
    public List<AccountVO> getSessionAccounts(String sessionId) {
        List<Account> accounts = accountDao.getSessionAccounts(sessionId);
        List<AccountVO> vos = new ArrayList<AccountVO>(accounts.size());

        for(Account account : accounts) {
            vos.add(mapper.map(account, AccountVO.class));
        }

        return vos;
    }
}
