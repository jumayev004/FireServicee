package com.example.fireservicee.controllers;

import com.example.fireservicee.models.Fire;
import com.example.fireservicee.models.User;
import com.example.fireservicee.services.FireService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class FireController {
    private final FireService fireService;

    @GetMapping("/")
    public String fire(@RequestParam(name = "subject", required = false) String subject, Principal principal, Model model) {
        model.addAttribute("fires", fireService.listFire(subject));
        model.addAttribute("user", fireService.getUserByPrincipal(principal));
        return "fires";
    }

    @GetMapping("/fire/{id}")
    public String fireInfo(@PathVariable("id") long id, Model model) {
        Fire fire = fireService.getFireById(id);
        model.addAttribute("fire", fire);
        return "fireinfo";
    }

    @GetMapping("/fire/create")
    public String openCreate(Principal principal, Model model) {
        User user = fireService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        return "fire-create";
    }

    @PostMapping("/fire/create")
    public String createFire(@ModelAttribute Fire fire, Principal principal) {
        fireService.saveFire(principal, fire);
        return "redirect:/my/fire";
    }

    @PostMapping("/fire/delete/{id}")
    public String deleteFire(@PathVariable Long id) {
        fireService.deleteFire(id);
        return "redirect:/";
    }

    @GetMapping("/my/fire")
    public String userFire(Principal principal, Model model) {
        User user = fireService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("fires", user.getFires());
        return "my-fires";
    }

    @GetMapping("/my/fire/{id}")
    public String userFire(@PathVariable Long id, Model model) {
        User user = fireService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("fires", user.getFires());
        return "my-fires";
    }
}
