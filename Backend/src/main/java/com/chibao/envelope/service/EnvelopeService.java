package com.chibao.envelope.service;

import com.chibao.envelope.dto.Envelopes;
import com.chibao.envelope.dto.SubEnvelopes;

import java.util.Map;
import java.util.Optional;

public interface EnvelopeService {
    Envelopes postEnvelopeDetails(Envelopes envelope);
    Map<String, Map> getEnvelopeDetails(Integer user_id);
    SubEnvelopes postSubEnvelopeDetails(SubEnvelopes subEnvelopes);
    Map<String, Map> getSubEnvelopeDetails();
}

