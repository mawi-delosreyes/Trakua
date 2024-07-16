package com.chibao.envelope.service.impl;

import com.chibao.envelope.dto.ScheduledTransactions;
import com.chibao.envelope.dto.Transactions;
import com.chibao.envelope.repository.ScheduledTransactionRepository;
import com.chibao.envelope.repository.TransactionRepository;
import com.chibao.envelope.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Optional;
import java.util.concurrent.TimeUnit;

@Service
public class TransactionServiceImpl implements TransactionService {

    @Autowired
    private TransactionRepository transactionRepository;

    @Autowired
    private ScheduledTransactionRepository scheduledTransactionRepository;

    public Transactions postTransactionDetails(Transactions transactions) {
        if(transactions.getNotes().isEmpty()) {
            transactions.setNotes(null);
        }
        return transactionRepository.save(transactions);
    }

    public ScheduledTransactions postScheduledTransactionDetails(ScheduledTransactions scheduledTransactions) {

        if(scheduledTransactions.getNotes().isEmpty()) {
            scheduledTransactions.setNotes(null);
        }

        return scheduledTransactionRepository.save(scheduledTransactions);
    }

    public Optional<Transactions> getTransactions(Integer envelope_id, boolean is_sub_envelope,
                                                     long transaction_date, Integer number_of_transactions) {

        Transactions transactions;

        if (!is_sub_envelope) {
            transactions = transactionRepository.findAllByEnvelopeIdAndTransactionDate(envelope_id, transaction_date);
        } else{
            transactions = transactionRepository.findAllBySubEnvelopeIdAndTransactionDate(envelope_id, transaction_date);
        }

        return Optional.of(transactions);
    }

    public Optional<ScheduledTransactions> getScheduledTransactions(Integer envelope_id, boolean is_sub_envelope,
                                                  long transaction_date, Integer number_of_transactions) {

        ScheduledTransactions scheduledTransactions;

        if (!is_sub_envelope) {
            scheduledTransactions = scheduledTransactionRepository.findAllByEnvelopeIdAndScheduledDate(envelope_id, transaction_date);
        } else{
            scheduledTransactions = scheduledTransactionRepository.findAllBySubEnvelopeIdAndScheduledDate(envelope_id, transaction_date);
        }

        return Optional.of(scheduledTransactions);
    }
}
