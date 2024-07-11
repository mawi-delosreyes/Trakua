package com.chibao.envelope.service;

import com.chibao.envelope.dto.Wallet;
import com.chibao.envelope.dto.WalletAccount;

public interface WalletService {
    Wallet postWalletDetails(Wallet wallet);
    WalletAccount postWalletAccountDetails(WalletAccount walletAccount);
}

