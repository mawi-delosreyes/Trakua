package com.chibao.envelope.service;

import com.chibao.envelope.dto.ProfileAnalytics;
import com.chibao.envelope.dto.ProfileDetails;

import java.time.Month;
import java.util.Map;
import java.util.Optional;

public interface ProfileService {

    Optional<ProfileDetails> getProfileDetails(Integer user_id);
    Optional<Map<Integer, Map>> getProfileAnalytics(Integer user_id);

}
