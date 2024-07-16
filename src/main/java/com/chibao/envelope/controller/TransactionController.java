package com.chibao.envelope.controller;

import com.chibao.envelope.dto.ScheduledTransactions;
import com.chibao.envelope.dto.Transactions;
import com.chibao.envelope.dto.Wallet;
import com.chibao.envelope.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.Optional;

@RestController
@RequestMapping("/transactions")

public class TransactionController {

    @Autowired
    TransactionService transactionService;

    @PostMapping("/addNewTransaction")
    public ResponseEntity postNewTransaction(
            @RequestBody Transactions transactions
    ) {

        try {
            transactionService.postTransactionDetails(transactions);
            return new ResponseEntity<>(HttpStatusCode.valueOf(200));
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatusCode.valueOf(400));
        }

    }

    @PostMapping("/addNewScheduledTransaction")
    public ResponseEntity postNewScheduledTransaction (
            @RequestBody ScheduledTransactions scheduledTransactions
    ) {
        try {
            transactionService.postScheduledTransactionDetails(scheduledTransactions);
            return new ResponseEntity<>(HttpStatusCode.valueOf(200));
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatusCode.valueOf(400));
        }
    }

    @GetMapping("/getTransactions")
    public Optional<Transactions> getTransactions(
            @RequestParam(required = true) Integer envelope_id,
            @RequestParam(required = true) Boolean is_sub_envelope,
            @RequestParam(required = true) long transaction_date,
            @RequestParam(required = true) Integer number_of_transactions
    ) {

        return transactionService.getTransactions(envelope_id, is_sub_envelope, transaction_date, number_of_transactions);
    }

    @GetMapping("/getScheduledTransactions")
    public Optional<ScheduledTransactions> getScheduledTransactions(
            @RequestParam(required = true) Integer envelope_id,
            @RequestParam(required = true) Boolean is_sub_envelope,
            @RequestParam(required = true) long scheduled_date,
            @RequestParam(required = true) Integer number_of_transactions
    ) {

        return transactionService.getScheduledTransactions(envelope_id, is_sub_envelope, scheduled_date, number_of_transactions);
    }
}
