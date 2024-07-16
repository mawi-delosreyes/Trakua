package com.chibao.envelope.service;

import com.chibao.envelope.dto.Wallet;
import com.chibao.envelope.dto.WalletAccount;

import java.util.Optional;

public interface WalletService {
    Wallet postWalletDetails(Wallet wallet);
    Optional<Wallet> getWalletDetails(Integer user_id);
    WalletAccount postWalletAccountDetails(WalletAccount walletAccount);

}

