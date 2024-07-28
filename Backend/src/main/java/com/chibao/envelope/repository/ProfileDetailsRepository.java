package com.chibao.envelope.repository;

import com.chibao.envelope.dto.ProfileDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProfileDetailsRepository extends JpaRepository<ProfileDetails, Integer> {

}
