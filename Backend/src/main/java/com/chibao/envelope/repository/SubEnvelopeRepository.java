package com.chibao.envelope.repository;

import com.chibao.envelope.dto.SubEnvelopes;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
@EnableJpaRepositories
public interface SubEnvelopeRepository extends JpaRepository<SubEnvelopes, Integer> {

    Optional<List<SubEnvelopes>> findAllByOrderBySubEnvelopeIdAsc();
    Optional<List<SubEnvelopes>> findAllByEnvelopeIdOrderBySubEnvelopeIdAsc(Integer envelopeId);

}
