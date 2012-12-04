package com.piraso.domain.dao;

import com.piraso.core.dao.BaseDaoImpl;
import com.piraso.domain.entity.Account;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import java.util.List;

public class AccountDaoImpl extends BaseDaoImpl<Account> implements AccountDao {
    public AccountDaoImpl() {
        super(Account.class);
    }

    @SuppressWarnings("unchecked")
    public List<Account> getSessionAccounts(String sessionId) {
        DetachedCriteria criteria = createDetachedCriteria();
        criteria.add(Restrictions.eq("sessionID", sessionId));
        criteria.addOrder(Order.asc("name"));

        return getHibernateTemplate().findByCriteria(criteria);
    }
}
