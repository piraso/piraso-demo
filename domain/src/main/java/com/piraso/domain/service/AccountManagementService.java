package com.piraso.domain.service;

import com.piraso.domain.vo.AccountVO;

import java.util.List;

public interface AccountManagementService {
    List<AccountVO> getSessionAccounts(String sessionId);

    int activate(String sessionId, List<String> accountNames);

    int archive(String sessionId, List<String> accountNames);

    int delete(String sessionId, List<String> accountNames);

    AccountVO addAccount(AccountVO account);
}
