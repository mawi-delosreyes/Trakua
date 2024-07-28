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
@Table(name = "Profile_Details")
@Entity
public class ProfileDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "email_address")
    private String emailAddress;

    @Column(name = "password")
    private String password;

    @Column(name = "currency")
    private String currency;

    @Column(name = "savings_goal")
    private double savingsGoal;

    @Column(name = "profile_picture")
    private byte[] profilePicture;

    @Column(name = "start_time_period")
    private long startTimePeriod;

    @Column(name = "end_time_period")
    private long endTimePeriod;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId() {
        this.userId = userId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName() {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName() {
        this.lastName = lastName;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress() {
        this.emailAddress = emailAddress;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword() {
        this.password = password;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency() {
        this.currency = currency;
    }

    public double getSavingsGoal() {
        return savingsGoal;
    }

    public void setSavingsGoal() {
        this.savingsGoal = savingsGoal;
    }

    public byte[] getProfilePicture() {
        return profilePicture;
    }

    public void setProfilePicture() {
        this.profilePicture = profilePicture;
    }

    public long getStartTimePeriod() {
        return startTimePeriod;
    }

    public void setStartTimePeriod(long startTimePeriod) {
        this.startTimePeriod = startTimePeriod;
    }

    public long getEndTimePeriod() {
        return endTimePeriod;
    }

    public void setEndTimePeriod(long endTimePeriod) {
        this.endTimePeriod = endTimePeriod;
    }

}