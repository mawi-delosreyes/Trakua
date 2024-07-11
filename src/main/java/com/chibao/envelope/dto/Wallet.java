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
    private Integer wallet_id;

    @Column(name = "user_id")
    private Integer user_id;

    @Column(name = "wallet_name")
    private String wallet_name;

    public Integer getWalletId() {
        return wallet_id;
    }

    public void setWalletId() {
        this.wallet_id = wallet_id;
    }

    public Integer getUserId() {
        return user_id;
    }

    public void setUserId() {
        this.user_id = user_id;
    }

    public String getWalletName() {
        return wallet_name;
    }

    public void setWalletName() {
        this.wallet_name = wallet_name;
    }

}
