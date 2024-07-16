package com.chibao.envelope.repository;

import com.chibao.envelope.dto.Wallet;
import org.springframework.data.jpa.repository.JpaRepository;

public interface WalletRepository extends JpaRepository<Wallet, Integer> {}

