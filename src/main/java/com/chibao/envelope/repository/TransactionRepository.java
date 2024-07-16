package com.chibao.envelope.repository;

import com.chibao.envelope.dto.Transactions;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Date;

public interface TransactionRepository extends JpaRepository<Transactions, Integer> {
    Transactions findAllByEnvelopeIdAndTransactionDate(Integer envelopeId, long transactionDate);
    Transactions findAllBySubEnvelopeIdAndTransactionDate(Integer envelopeId, long transactionDate);
}
