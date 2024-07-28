package com.chibao.envelope.dto;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
@Table(name = "Profile_Analytics")
@Entity
public class ProfileAnalytics {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_analytics_id")
    private Integer userAnalyticsId;

    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "analytics_date")
    private long analyticsDate;

    @Column(name = "needs")
    private double needs;

    @Column(name = "wants")
    private double wants;

    @Column(name = "savings")
    private double savings;

    public Integer getUserAnalyticsId() {
        return userAnalyticsId;
    }

    public void setUserAnalyticsId() {
        this.userAnalyticsId = userAnalyticsId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId() {
        this.userId = userId;
    }

    public long getAnalyticsDate() {
        return analyticsDate;
    }

    public void setAnalyticsDate() {
        this.analyticsDate = analyticsDate;
    }

    public double getNeeds() {
        return needs;
    }

    public void setNeeds() {
        this.needs = needs;
    }

    public double getWants() {
        return wants;
    }

    public void setWants() {
        this.wants = wants;
    }

    public double getSavings() {
        return savings;
    }

    public void setSavings() {
        this.savings = savings;
    }

}
