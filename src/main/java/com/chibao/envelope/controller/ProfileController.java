package com.chibao.envelope.controller;
import com.chibao.envelope.dto.Profile;
import com.chibao.envelope.service.ProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@RestController
@RequestMapping("/user")

public class ProfileController {

    @Autowired
    private ProfileService profileService;

    @GetMapping("/getProfile")
    public Optional<Profile> getUserProfile(
            @RequestParam(required = true) Integer user_id
    ) {
        return profileService.getUserProfile(user_id);
    }

}
