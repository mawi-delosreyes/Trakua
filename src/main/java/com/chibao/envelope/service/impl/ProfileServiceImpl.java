package com.chibao.envelope.service.impl;

import com.chibao.envelope.dto.Profile;
import com.chibao.envelope.repository.ProfileRepository;
import com.chibao.envelope.service.ProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;


@Service

public class ProfileServiceImpl implements ProfileService {

    @Autowired
    private ProfileRepository profileRepository;

    @Override
    public Optional<Profile> getUserProfile(Integer user_id) {
        return profileRepository.findById(user_id);
    }
}
