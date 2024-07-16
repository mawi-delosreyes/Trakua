package com.chibao.envelope.service;

import com.chibao.envelope.dto.ScheduledTransactions;
import com.chibao.envelope.dto.Transactions;

import java.util.Date;
import java.util.Optional;

public interface TransactionService {
    Transactions postTransactionDetails(Transactions transactions);
    Optional<Transactions> getTransactions(Integer envelope_id, boolean is_sub_envelope, long transaction_date, Integer number_of_transactions);
    ScheduledTransactions postScheduledTransactionDetails(ScheduledTransactions scheduledTransactions);
    Optional<ScheduledTransactions> getScheduledTransactions(Integer envelope_id, boolean is_sub_envelope, long scheduled_date, Integer number_of_transactions);
}

