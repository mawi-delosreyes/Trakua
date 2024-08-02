package com.chibao.envelope.service.impl;

import com.chibao.envelope.dto.ProfileAnalytics;
import com.chibao.envelope.dto.ProfileDetails;
import com.chibao.envelope.repository.ProfileAnalyticsRepository;
import com.chibao.envelope.repository.ProfileDetailsRepository;
import com.chibao.envelope.service.ProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.Month;
import java.util.*;


@Service

public class ProfileServiceImpl implements ProfileService {

    @Autowired
    private ProfileDetailsRepository profileDetailsRepository;

    @Autowired
    private ProfileAnalyticsRepository profileAnalyticsRepository;



    @Override
    public Map<String, Object> getProfileDetails(Integer user_id) {

        Optional<ProfileDetails> profile_details = profileDetailsRepository.findById(user_id);
        Map<String, Object> profile_details_map = new HashMap<>();

        if (!profile_details.isEmpty()) {
            profile_details_map.put("first_name", profile_details.get().getFirstName());
            profile_details_map.put("last_name", profile_details.get().getLastName());
            profile_details_map.put("email_address", profile_details.get().getEmailAddress());
            profile_details_map.put("currency", profile_details.get().getCurrency());
            profile_details_map.put("savings_goal", profile_details.get().getSavingsGoal());
            profile_details_map.put("start_period", profile_details.get().getStartTimePeriod());
            profile_details_map.put("end_period", profile_details.get().getEndTimePeriod());
            profile_details_map.put("profile_picture", profile_details.get().getProfilePicture());
        }

        return profile_details_map;
    }

    @Override
    public Optional<Map<Integer, Map>> getProfileAnalytics(Integer user_id) {
        Calendar cal = Calendar.getInstance();
        Map<Integer, Map> analytics_data = new HashMap<>();

        Optional<List<ProfileAnalytics>> user_analytics = profileAnalyticsRepository.findTop5ByUserIdOrderByUserAnalyticsIdDesc(user_id);

        if (!user_analytics.isEmpty()) {

            for(ProfileAnalytics analytics : user_analytics.get()) {
                Map<String, Map> month_data = new HashMap<>();

                Map<String, Double> needs_map = new HashMap<>();
                Map<String, Double> wants_map = new HashMap<>();
                Map<String, Double> savings_map = new HashMap<>();

                Long analytics_date = analytics.getAnalyticsDate();
                Date date = new java.util.Date((long)analytics_date * 1000);
                cal.setTime(date);

                double needs = analytics.getNeeds();
                double wants = analytics.getWants();
                double savings = analytics.getSavings();
                double month_total = needs + wants + savings;

                needs_map.put("amount", analytics.getNeeds());
                needs_map.put("percentage", (needs / month_total) * 100);
                wants_map.put("amount", analytics.getWants());
                wants_map.put("percentage", (wants / month_total) * 100);
                savings_map.put("amount", analytics.getSavings());
                savings_map.put("percentage", (savings / month_total) * 100);

                month_data.put("needs", needs_map);
                month_data.put("wants", wants_map);
                month_data.put("savings", savings_map);

                analytics_data.put(cal.get(Calendar.MONTH) + 1, month_data);

            }
        }

        return Optional.of(analytics_data);
    }

}
