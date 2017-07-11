package ru.kpfu.itis.jblab.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.kpfu.itis.jblab.model.User;
import ru.kpfu.itis.jblab.repository.UserRepository;
import ru.kpfu.itis.jblab.service.UserService;

/**
 * Created by Марат on 10.07.2017.
 */
@Service
public class UserServiceImpl implements UserService {
    private final UserRepository userRepository;

    @Autowired
    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public void add(User user) {
        userRepository.save(user);
    }

    @Override
    public void delete(User user) {
        userRepository.delete(user);
    }

    @Override
    public User getOne(Long id) {
        return userRepository.getOne(id);
    }
}
