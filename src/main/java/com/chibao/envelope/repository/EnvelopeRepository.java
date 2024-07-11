package com.chibao.envelope.repository;

import com.chibao.envelope.dto.Envelopes;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EnvelopeRepository extends JpaRepository<Envelopes, Integer> {
}
