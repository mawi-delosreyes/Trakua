package com.chibao.envelope.controller;

import com.chibao.envelope.dto.Envelopes;
import com.chibao.envelope.dto.SubEnvelopes;
import com.chibao.envelope.dto.Wallet;
import com.chibao.envelope.service.EnvelopeService;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.Optional;

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

    @PostMapping("createNewSubEnvelope")
    public ResponseEntity postSubEnvelopeDetails(
            @RequestBody SubEnvelopes subEnvelopes
    ) {
        try {
            envelopeService.postSubEnvelopeDetails(subEnvelopes);
            return new ResponseEntity<>(HttpStatusCode.valueOf(200));
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatusCode.valueOf(400));
        }
    }

    @GetMapping("/getEnvelopes")
    public Map<String, Map> getEnvelopeDetails(
            @RequestParam(required = true) Integer user_id
    ) {
        return envelopeService.getEnvelopeDetails(user_id);
    }

    @GetMapping("/getSubEnvelopes")
    public Map<String, Map> getSubEnvelopeDetails(
            @RequestParam(required = true) Integer envelope_id
    ) {
        return envelopeService.getSubEnvelopeDetails();
    }
}
