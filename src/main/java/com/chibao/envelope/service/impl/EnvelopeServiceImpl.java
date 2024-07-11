package com.chibao.envelope.service.impl;

import com.chibao.envelope.dto.Envelopes;
import com.chibao.envelope.repository.EnvelopeRepository;
import com.chibao.envelope.service.EnvelopeService;
import org.springframework.beans.factory.annotation.Autowired;

public class EnvelopeServiceImpl implements EnvelopeService {

    @Autowired
    private EnvelopeRepository envelopeRepository;

    public Envelopes postEnvelopeDetails(Envelopes envelopes) {
        return envelopeRepository.save(envelopes);
    }
}
