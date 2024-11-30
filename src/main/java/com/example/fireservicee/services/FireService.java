package com.example.fireservicee.services;

import com.example.fireservicee.models.Fire;
import com.example.fireservicee.models.User;
import com.example.fireservicee.repositories.UserRepository;
import com.example.fireservicee.repositories.FireRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
@RequiredArgsConstructor
public class FireService {
    private final FireRepository fireRepository;
    private final UserRepository userRepository;

    public List<Fire> listFire(String subject) {
        if (subject != null) return fireRepository.findBySubject(subject);
        return fireRepository.findAll();
    }

    public void saveFire(Principal principal, Fire fire) {
        fire.setUser(getUserByPrincipal(principal));
        fireRepository.save(fire);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    public void deleteFire(Long id) {
        fireRepository.deleteById(id);
    }

    public Fire getFireById(Long id) {
        return fireRepository.findById(id).orElse(null);
    }

    public User getUserById(Long userId) {
        return userRepository.findById(userId).orElse(null);
    }
}
