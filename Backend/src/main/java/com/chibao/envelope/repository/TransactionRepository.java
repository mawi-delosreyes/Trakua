package com.chibao.envelope.repository;

import com.chibao.envelope.dto.Transactions;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Date;
import java.util.List;
import java.util.Optional;

public interface TransactionRepository extends JpaRepository<Transactions, Integer> {
    Transactions findAllByEnvelopeIdAndTransactionDate(Integer envelopeId, long transactionDate);
    Transactions findAllBySubEnvelopeIdAndTransactionDate(Integer envelopeId, long transactionDate);
    Optional<List<Transactions>> findTop7BySubEnvelopeIdOrderByTransactionDateDesc(Integer subEnvelopeId);
    Optional<List<Transactions>> findTop3BySubEnvelopeIdOrderByTransactionAmount(Integer subEnvelopeId);
}
