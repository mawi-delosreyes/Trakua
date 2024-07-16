package com.chibao.envelope.dto;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
@Table(name = "Envelopes")
@Entity
public class Envelopes {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "envelope_id")
    private Integer envelopeId;

    @Column(name = "envelope_name")
    private String envelopeName;

    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "envelope_total_balance")
    private double envelopeTotalBalance;

    @Column(name = "envelope_balance")
    private double envelopeBalance;

    @Column(name = "envelope_type")
    private String envelopeType;

    @Column(name = "number_of_sub_envelopes")
    private Integer numberOfSubEnvelopes;

    public Integer getEnvelopeId() {
        return envelopeId;
    }

    public void setEnvelopeId() {
        this.envelopeId = envelopeId;
    }

    public String getEnvelopeName() {
        return envelopeName;
    }

    public void setEnvelopeName() {
        this.envelopeName = envelopeName;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId() {
        this.userId = userId;
    }

    public double getEnvelopeTotalBalance(Integer envelope_id) {
        return envelopeTotalBalance;
    }

    public void setEnvelopeTotalBalance(double envelope_total_balance) {
        this.envelopeTotalBalance = envelope_total_balance;
    }

    public double getEnvelopeBalance(Integer envelope_id) {
        return envelopeBalance;
    }

    public void setEnvelopeBalance(double envelope_balance) {
        this.envelopeBalance = envelope_balance;
    }

    public String getEnvelopeType() {
        return envelopeType;
    }

    public void setEnvelopeType() {
        this.envelopeType = envelopeType;
    }

    public Integer getNumberOfSubEnvelopes() {
        return numberOfSubEnvelopes;
    }

    public void setNumberOfSubEnvelopes() {
        this.numberOfSubEnvelopes = numberOfSubEnvelopes;
    }
}
