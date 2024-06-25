package com.ChiBao.Envelopes.envelope;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class getEnvelopes {
    @GetMapping("/getEnvelopes")
    public String Hello(){
        return "Hello";
    }
}
