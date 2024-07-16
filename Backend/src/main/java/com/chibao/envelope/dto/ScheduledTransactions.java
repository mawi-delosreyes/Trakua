package com.chibao.envelope.dto;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
@Table(name = "Scheduled_Transactions")
@Entity
public class ScheduledTransactions {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "scheduled_transaction_id")
    private Integer scheduledTransactionId;

    @Column(name = "envelope_id")
    private Integer envelopeId;

    @Column(name = "sub_envelope_id")
    private Integer subEnvelopeId;

    @Column(name = "scheduled_date")
    private long scheduledDate;

    @Column(name = "transaction_amount")
    private double transactionAmount;

    @Column(name = "notes")
    private String notes;

    @Column(name = "transaction_type")
    private String transactionType;

    @Column(name = "account_id")
    private Integer accountId;

    @Column(name = "from_envelope_id")
    private Integer fromEnvelopeId;

    @Column(name = "is_transfer")
    private Boolean isTransfer;

    @Column(name = "from_sub_envelope_id")
    private Integer fromSubEnvelopeId;


    public Integer getScheduledTransactionId() {
        return scheduledTransactionId;
    }

    public void setScheduledTransactionId() {
        this.scheduledTransactionId = scheduledTransactionId;
    }

    public Integer getEnvelopeId() {
        return envelopeId;
    }

    public void setEnvelopeId() {
        this.envelopeId = envelopeId;
    }

    public Integer getSubEnvelopeId() {
        return subEnvelopeId;
    }

    public void setSubEnvelopeId() {
        this.subEnvelopeId = subEnvelopeId;
    }

    public long getScheduledDate() {
        return scheduledDate;
    }

    public void setScheduledDate() {
        this.scheduledDate = scheduledDate;
    }

    public double getTransactionAmount() {
        return transactionAmount;
    }

    public void setTransactionAmount() {
        this.transactionAmount = transactionAmount;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes() {
        this.notes = notes;
    }

    public String getTransactionType() {
        return transactionType;
    }

    public void setTransactionType() {
        this.transactionType = transactionType;
    }

    public Integer getAccountId() {
        return accountId;
    }

    public void setAccountId() {
        this.accountId = accountId;
    }

    public Integer getFromEnvelopeId() {
        return fromEnvelopeId;
    }

    public void setFromEnvelope() {
        this.fromEnvelopeId = fromEnvelopeId;
    }


    public Boolean getIsTransfer() {
        return isTransfer;
    }

    public void setIsTransfer() {
        this.isTransfer = isTransfer;
    }

    public Integer getFromSubEnvelopeId() {
        return fromSubEnvelopeId;
    }

    public void setFromSubEnvelopeId() {
        this.fromSubEnvelopeId = fromSubEnvelopeId;
    }
}
