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
@Table(name = "Sub_Envelopes")
@Entity
public class SubEnvelopes {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "sub_envelope_id")
    private Integer subEnvelopeId;

    @Column(name = "sub_envelope_name")
    private String subEnvelopeName;

    @Column(name = "sub_envelope_total_balance")
    private double subEnvelopeTotalBalance;

    @Column(name = "sub_envelope_balance")
    private double subEnvelopeBalance;

    @Column(name = "envelope_id")
    private Integer envelopeId;

    public Integer getSubEnvelopeId() {
        return subEnvelopeId;
    }

    public void setSubEnvelopeId() {
        this.subEnvelopeId = subEnvelopeId;
    }

    public String getSubEnvelopeName() {
        return subEnvelopeName;
    }

    public void setSubEnvelopeName() {
        this.subEnvelopeName = subEnvelopeName;
    }

    public double getSubEnvelopeTotalBalance() {
        return subEnvelopeTotalBalance;
    }

    public void setSubEnvelopeTotalBalance() {
        this.subEnvelopeTotalBalance = subEnvelopeBalance;
    }

    public double getSubEnvelopeBalance() {
        return subEnvelopeBalance;
    }

    public void setSubEnvelopeBalance() {
        this.subEnvelopeBalance = subEnvelopeBalance;
    }

    public Integer getEnvelopeId() {
        return envelopeId;
    }

    public void setEnvelopeId() {
        this.envelopeId = envelopeId;
    }
}
