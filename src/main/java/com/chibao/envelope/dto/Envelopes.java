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
    private Integer envelope_id;

    @Column(name = "envelope_name")
    private String envelope_name;

    @Column(name = "user_id")
    private Integer user_id;

    @Column(name = "envelope_total_balance")
    private double envelope_total_balance;

    @Column(name = "envelope_balance")
    private double envelope_balance;

    @Column(name = "envelope_type")
    private String envelope_type;

    @Column(name = "number_of_sub_envelopes")
    private Integer number_of_sub_envelopes;

    public Integer getEnvelopeId() {
        return envelope_id;
    }

    public void setEnvelopeId() {
        this.envelope_id = envelope_id;
    }

    public String getEnvelopeName() {
        return envelope_name;
    }

    public void setEnvelopeName() {
        this.envelope_name = envelope_name;
    }

    public Integer getUserId() {
        return user_id;
    }

    public void setUserId() {
        this.user_id = user_id;
    }

    public double getEnvelopeTotalBalance() {
        return envelope_total_balance;
    }

    public void setEnvelopeTotalBalance() {
        this.envelope_total_balance = envelope_total_balance;
    }

    public double getEnvelopeBalance() {
        return envelope_balance;
    }

    public void setEnvelopeBalance() {
        this.envelope_balance = envelope_balance;
    }

    public String getEnvelopeType() {
        return envelope_type;
    }

    public void setEnvelopeType() {
        this.envelope_type = envelope_type;
    }

    public Integer getNumberOfSubEnvelopes() {
        return number_of_sub_envelopes;
    }

    public void setNumberOfSubEnvelopes() {
        this.number_of_sub_envelopes = number_of_sub_envelopes;
    }
}
