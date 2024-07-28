package com.chibao.envelope.controller;
import com.chibao.envelope.dto.ProfileAnalytics;
import com.chibao.envelope.dto.ProfileDetails;
import com.chibao.envelope.service.ProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.Month;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/user")

public class ProfileController {

    @Autowired
    private ProfileService profileService;

    @GetMapping("/getProfileDetails")
    public Optional<ProfileDetails> getProfileDetails (
            @RequestParam(required = true) Integer user_id
    ) {
        return profileService.getProfileDetails(user_id);
    }

    @GetMapping("/getProfileAnalytics")
    public Optional<Map<Integer, Map>> getProfileAnalytics (
            @RequestParam(required = true) Integer user_id
    ) {
        return profileService.getProfileAnalytics(user_id);
    }
    
}
