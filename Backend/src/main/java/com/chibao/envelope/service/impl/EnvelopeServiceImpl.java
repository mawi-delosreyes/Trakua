package com.chibao.envelope.service.impl;

import com.chibao.envelope.dto.*;
import com.chibao.envelope.repository.EnvelopeRepository;
import com.chibao.envelope.repository.ScheduledTransactionRepository;
import com.chibao.envelope.repository.SubEnvelopeRepository;
import com.chibao.envelope.repository.TransactionRepository;
import com.chibao.envelope.service.EnvelopeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class EnvelopeServiceImpl implements EnvelopeService {

    @Autowired
    private EnvelopeRepository envelopeRepository;

    @Autowired
    private SubEnvelopeRepository subEnvelopeRepository;

    @Autowired
    private TransactionRepository transactionRepository;

    @Autowired
    private ScheduledTransactionRepository scheduledTransactionRepository;

    public Envelopes postEnvelopeDetails(Envelopes envelopes) {
        envelopes.setEnvelopeTotalBalance(0);
        envelopes.setEnvelopeBalance(0);
        return envelopeRepository.save(envelopes);
    }

    public SubEnvelopes postSubEnvelopeDetails(SubEnvelopes subEnvelopes) {
        Integer envelope_id = subEnvelopes.getEnvelopeId();
        Envelopes envelope_details = envelopeRepository.findById(envelope_id).orElse(null);

        if (envelope_details != null) {
            double envelope_balance = envelope_details.getEnvelopeBalance();
            double envelope_total_balance = envelope_details.getEnvelopeTotalBalance();

            double new_envelope_balance = envelope_balance + subEnvelopes.getSubEnvelopeBalance();
            double new_envelope_total_balance = envelope_total_balance + subEnvelopes.getSubEnvelopeTotalBalance();

            envelope_details.setEnvelopeBalance(new_envelope_balance);
            envelope_details.setEnvelopeTotalBalance(new_envelope_total_balance);

            envelopeRepository.save(envelope_details);
        }

        return subEnvelopeRepository.save(subEnvelopes);
    }

    public Map<String, Map> getEnvelopeDetails(Integer user_id) {
        Optional<List<Envelopes>> envelopeData = envelopeRepository.findAllByOrderByEnvelopeIdAsc();
        Map<String, Map> all_envelope_map = new HashMap<>();

        if (!envelopeData.isEmpty()) {

            for(Envelopes envelope : envelopeData.get()) {
                Map<String, Object> indiv_envelope = new HashMap<>();

                Integer envelope_id = envelope.getEnvelopeId();
                String envelope_name = envelope.getEnvelopeName();
                String envelope_type = envelope.getEnvelopeType();
                double envelope_total = envelope.getEnvelopeTotalBalance();
                double envelope_balance = envelope.getEnvelopeBalance();

                double envelope_balance_left = envelope_total - envelope_balance;
                double envelope_percentage_filled = (envelope_balance_left / envelope_total) * 100;



                // get sub-envelopes
                Map<String, Map> all_sub_envelopes = new HashMap<>();
                Map<String, Double> top_three_expenses = new HashMap<>();


                Optional<List<SubEnvelopes>> sub_envelope_list = subEnvelopeRepository.findAllByEnvelopeIdOrderBySubEnvelopeIdAsc(envelope_id);

                if (!sub_envelope_list.isEmpty()) {

                    for (SubEnvelopes sub_envelope : sub_envelope_list.get()) {
                        Map<String, Object> sub_envelope_details = new HashMap<>();
                        sub_envelope_details.put("sub_envelope_id", sub_envelope.getEnvelopeId());
                        sub_envelope_details.put("balance", sub_envelope.getSubEnvelopeBalance());
                        sub_envelope_details.put("total_balance", sub_envelope.getSubEnvelopeTotalBalance());

                        all_sub_envelopes.put(sub_envelope.getSubEnvelopeName(), sub_envelope_details);

                        // get sub envelope expense
                        double expense = sub_envelope.getSubEnvelopeTotalBalance() - sub_envelope.getSubEnvelopeBalance();
                        top_three_expenses.put(sub_envelope.getSubEnvelopeName(), expense);

                    }
                }

                indiv_envelope.put("envelope_id", envelope_id);
                indiv_envelope.put("envelope_name", envelope_name);
                indiv_envelope.put("envelope_type", envelope_type);
                indiv_envelope.put("percentage_filled", envelope_percentage_filled);
                indiv_envelope.put("balance", envelope_balance);
                indiv_envelope.put("envelope_capacity_used", envelope_balance);
                indiv_envelope.put("envelope_capacity", envelope_total);
                indiv_envelope.put("top_three_exenses", top_three_expenses);
                indiv_envelope.put("sub_envelopes", all_sub_envelopes);

                all_envelope_map.put(envelope_name, indiv_envelope);
            }
        }

        return all_envelope_map;
    }

    @Transactional
    public Map<String, Map> getSubEnvelopeDetails() {
        Optional<List<SubEnvelopes>> subEnvelopeData = subEnvelopeRepository.findAllByOrderBySubEnvelopeIdAsc();
        Map<String, Map> all_sub_envelope_map = new HashMap<>();

        if (!subEnvelopeData.isEmpty()) {

            for(SubEnvelopes subEnvelope : subEnvelopeData.get()) {

                Map<String, Object> indiv_sub_envelope = new HashMap<>();


                Integer sub_envelope_id = subEnvelope.getSubEnvelopeId();
                String sub_envelope_name = subEnvelope.getSubEnvelopeName();
                double sub_envelope_total = subEnvelope.getSubEnvelopeTotalBalance();
                double sub_envelope_balance = subEnvelope.getSubEnvelopeBalance();
                boolean sub_envelope_roll_over = subEnvelope.getRollOver();

                double sub_envelope_balance_left = sub_envelope_total - sub_envelope_balance;
                double sub_envelope_percentage_filled = (sub_envelope_balance_left / sub_envelope_total) * 100;

                // get days until topup
                Optional<ScheduledTransactions> earliest_topup = scheduledTransactionRepository.findBySubEnvelopeIdOrderByScheduledDateDesc(sub_envelope_id);
                long num_days_until_topup = 0;
                if (!earliest_topup.isEmpty()) {
                    long topup_date = earliest_topup.get().getScheduledDate();
                    long current_unix_timestamp = System.currentTimeMillis() / 1000L;

                    num_days_until_topup = topup_date - current_unix_timestamp;

                    if (num_days_until_topup < 0) {
                        num_days_until_topup = 0;
                    }
                }

                // get latest transactions
                Optional<List<Transactions>> latest_transactions = transactionRepository.findTop7BySubEnvelopeIdOrderByTransactionDateDesc(sub_envelope_id);
                List daily_transactions = new ArrayList();
                if (!latest_transactions.isEmpty()) {
                    for (Transactions transaction : latest_transactions.get()) {
                        double transaction_amount = transaction.getTransactionAmount();
                        daily_transactions.add(transaction_amount);
                    }
                }

                // get top_three_expenses
                Optional<List<Transactions>> top_three_expense = transactionRepository.findTop3BySubEnvelopeIdOrderByTransactionAmount(sub_envelope_id);
                Map<String, Double> top_three = new HashMap<>();
                if (!top_three_expense.isEmpty()) {
                    for (Transactions top_expenses : top_three_expense.get()) {
                        String expense_name = top_expenses.getSubEnvelopeSet().getSubEnvelopeName();
                        double expense_amount = top_expenses.getTransactionAmount();
                        top_three.put(expense_name, expense_amount);
                    }
                }



                indiv_sub_envelope.put("sub_envelope_name", sub_envelope_name);
                indiv_sub_envelope.put("sub_envelope_id", sub_envelope_id);
                indiv_sub_envelope.put("percentage_filled", sub_envelope_percentage_filled);
                indiv_sub_envelope.put("balance", sub_envelope_balance_left);
                indiv_sub_envelope.put("sub_envelope_capacity_used", sub_envelope_balance);
                indiv_sub_envelope.put("sub_envelope_capacity", sub_envelope_total);
                indiv_sub_envelope.put("roll_over", sub_envelope_roll_over);
                indiv_sub_envelope.put("days_until_next_topup", num_days_until_topup);
                indiv_sub_envelope.put("latest_daily_transactions", daily_transactions);
                indiv_sub_envelope.put("top_three_expenses", top_three);

                all_sub_envelope_map.put(sub_envelope_name, indiv_sub_envelope);
            }
        }

        return all_sub_envelope_map;

    }

}
