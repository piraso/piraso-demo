package com.piraso.domain.service;

import com.piraso.domain.vo.AccountVO;

import java.util.List;

public interface AccountManagementService {
    List<AccountVO> getSessionAccounts(String sessionId);

    AccountVO addAccount(AccountVO account);
}
