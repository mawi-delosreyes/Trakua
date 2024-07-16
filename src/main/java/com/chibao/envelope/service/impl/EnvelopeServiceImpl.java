package com.chibao.envelope.service.impl;

import com.chibao.envelope.dto.Envelopes;
import com.chibao.envelope.dto.SubEnvelopes;
import com.chibao.envelope.repository.EnvelopeRepository;
import com.chibao.envelope.repository.SubEnvelopeRepository;
import com.chibao.envelope.service.EnvelopeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
public class EnvelopeServiceImpl implements EnvelopeService {

    @Autowired
    private EnvelopeRepository envelopeRepository;

    @Autowired
    private SubEnvelopeRepository subEnvelopeRepository;

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

    public Optional<Envelopes> getEnvelopeDetails(Integer user_id) {
        return envelopeRepository.findById(user_id);
    }

    @Transactional
    public Optional<SubEnvelopes> getSubEnvelopeDetails(Integer envelope_id) {
        return subEnvelopeRepository.findById(envelope_id);
    }

}
