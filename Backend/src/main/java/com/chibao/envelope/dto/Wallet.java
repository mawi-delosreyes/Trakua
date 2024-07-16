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
@Table(name = "Wallets")
@Entity
public class Wallet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "wallet_id")
    private Integer walletId;

    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "wallet_name")
    private String walletName;

    public Integer getWalletId() {
        return walletId;
    }

    public void setWalletId() {
        this.walletId = walletId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId() {
        this.userId = userId;
    }

    public String getWalletName() {
        return walletName;
    }

    public void setWalletName() {
        this.walletName = walletName;
    }
}
