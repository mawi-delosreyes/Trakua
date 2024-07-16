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
@Table(name = "User_Profile")
@Entity
public class Profile {

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

    @Column(name = "monthly_income")
    private double monthlyIncome;

    @Column(name = "savings_goal")
    private double savingsGoal;

}
