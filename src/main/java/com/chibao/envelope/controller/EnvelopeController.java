package com.chibao.envelope.controller;

import com.chibao.envelope.dto.Envelopes;
import com.chibao.envelope.service.EnvelopeService;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/envelopes")

public class EnvelopeController {

    @Autowired
    private EnvelopeService envelopeService;

    @PostMapping("createNewEnvelope")
    public ResponseEntity postEnvelopeDetails(
            @RequestBody Envelopes envelopes
    ) {
        try {
            envelopeService.postEnvelopeDetails(envelopes);
            return new ResponseEntity<>(HttpStatusCode.valueOf(200));
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatusCode.valueOf(400));
        }
    }
}
