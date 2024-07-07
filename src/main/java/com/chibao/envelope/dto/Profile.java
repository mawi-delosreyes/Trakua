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
    private Integer user_id;
    private String first_name;
    private String last_name;
    private String email_address;
    private String password;
    private String currency;
    private double monthly_income;
    private double savings_goal;

}
