package com.chibao.envelope.repository;

import com.chibao.envelope.dto.ProfileAnalytics;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProfileAnalyticsRepository extends JpaRepository<ProfileAnalytics, Integer> {

    Optional<List<ProfileAnalytics>> findTop5ByUserIdOrderByUserAnalyticsIdDesc(Integer userId);
}