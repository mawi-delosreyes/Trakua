package com.chibao.envelope.dto;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
@Table(name = "Wallet_Accounts")
@Entity
public class WalletAccount {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "account_id")
    private Integer accountId;

    @Column(name = "wallet_id")
    private Integer walletId;

    @Column(name = "account_name")
    private String accountName;

    @Column(name = "account_balance")
    private double accountBalance;

    public Integer getAccountId() {
        return accountId;
    }

    public void setAccountId() {
        this.accountId = accountId;
    }

    public Integer getWalletId() {
        return walletId;
    }

    public void setWalletId() {
        this.walletId = walletId;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName() {
        this.accountName = accountName;
    }

    public double getAccountBalance() {
        return accountBalance;
    }

    public void setAccountBalance() {
        this.accountBalance = accountBalance;
    }
}

