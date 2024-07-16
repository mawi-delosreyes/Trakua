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
@Table(name = "Transactions")
@Entity
public class Transactions {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "transaction_id")
    private Integer transactionId;

    @Column(name = "envelope_id")
    private Integer envelopeId;

    @Column(name = "sub_envelope_id")
    private Integer subEnvelopeId;

    @Column(name = "transaction_date")
    private long transactionDate;

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


    public Integer getTransactionId() {
        return transactionId;
    }

    public void setTransactionId() {
        this.transactionId = transactionId;
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

    public long getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate() {
        this.transactionDate = transactionDate;
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
