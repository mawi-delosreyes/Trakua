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
    private Integer account_id;

    @Column(name = "wallet_id")
    private Integer wallet_id;

    @Column(name = "account_name")
    private String account_name;

    @Column(name = "account_balance")
    private double account_balance;

    public Integer getAccountId() {
        return account_id;
    }

    public void setAccountId() {
        this.account_id = account_id;
    }

    public Integer getWalletId() {
        return wallet_id;
    }

    public void setWalletId() {
        this.wallet_id = wallet_id;
    }

    public String getAccountName() {
        return account_name;
    }

    public void setAccountName() {
        this.account_name = account_name;
    }

    public double getAccountBalance() {
        return account_balance;
    }

    public void setAccountBalance() {
        this.account_balance = account_balance;
    }
}

