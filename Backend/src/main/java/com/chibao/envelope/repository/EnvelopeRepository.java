package com.chibao.envelope.repository;

import com.chibao.envelope.dto.Envelopes;
import com.chibao.envelope.dto.SubEnvelopes;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Repository
public interface EnvelopeRepository extends JpaRepository<Envelopes, Integer> {
}
