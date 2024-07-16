package com.chibao.envelope.service;

import com.chibao.envelope.dto.Profile;

import java.util.Optional;

public interface ProfileService {

    Optional<Profile> getUserProfile(Integer user_id);
}
