package com.chibao.envelope.service;

import com.chibao.envelope.dto.Envelopes;
import com.chibao.envelope.dto.SubEnvelopes;

import java.util.Optional;

public interface EnvelopeService {
    Envelopes postEnvelopeDetails(Envelopes envelope);
    Optional<Envelopes> getEnvelopeDetails(Integer user_id);
    SubEnvelopes postSubEnvelopeDetails(SubEnvelopes subEnvelopes);
    Optional<SubEnvelopes> getSubEnvelopeDetails(Integer envelope_id);
}

