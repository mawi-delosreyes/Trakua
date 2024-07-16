package com.chibao.envelope.controller;

import com.chibao.envelope.dto.Wallet;
import com.chibao.envelope.dto.WalletAccount;
import com.chibao.envelope.service.WalletService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/wallet")

public class WalletController {

    @Autowired
    private WalletService walletService;

    @PostMapping("/createNewWallet")
    public ResponseEntity postWalletDetails(
            @RequestBody Wallet wallet
    ) {
        try{
            walletService.postWalletDetails(wallet);
            return new ResponseEntity<>(HttpStatusCode.valueOf(200));
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatusCode.valueOf(400));
        }

    }

    @PostMapping("/createNewWalletAccount")
    public ResponseEntity postWalletAccountDetails(
            @RequestBody WalletAccount walletAccount
    ) {
        try {
            walletService.postWalletAccountDetails(walletAccount);
            return new ResponseEntity<>(HttpStatusCode.valueOf(200));
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatusCode.valueOf(400));
        }
    }

    @GetMapping("/getWallet")
    public Optional<Wallet> getWalletDetails(
            @RequestParam(required = true) Integer user_id
    ) {
        return walletService.getWalletDetails(user_id);
    }
}
