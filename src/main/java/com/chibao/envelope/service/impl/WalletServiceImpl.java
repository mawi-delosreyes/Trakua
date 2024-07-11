package com.chibao.envelope.service.impl;

import com.chibao.envelope.dto.Wallet;
import com.chibao.envelope.dto.WalletAccount;
import com.chibao.envelope.repository.WalletAccountRepository;
import com.chibao.envelope.repository.WalletRepository;
import com.chibao.envelope.service.WalletService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WalletServiceImpl implements WalletService {

    @Autowired
    private WalletRepository walletRepository;

    @Autowired
    private WalletAccountRepository walletAccountRepository;

    public Wallet postWalletDetails(Wallet wallet) {
        return walletRepository.save(wallet);
    }

    public WalletAccount postWalletAccountDetails(WalletAccount walletAccount) {
        return walletAccountRepository.save(walletAccount);
    }

}
