package com.chibao.envelope.repository;

import com.chibao.envelope.dto.ScheduledTransactions;
import com.chibao.envelope.dto.Transactions;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ScheduledTransactionRepository extends JpaRepository<ScheduledTransactions, Integer> {
    ScheduledTransactions findAllByEnvelopeIdAndScheduledDate(Integer envelopeId, long transactionDate);
    ScheduledTransactions findAllBySubEnvelopeIdAndScheduledDate(Integer envelopeId, long transactionDate);
    Optional<ScheduledTransactions> findBySubEnvelopeIdOrderByScheduledDateDesc(Integer subEnvelopeId);
}
