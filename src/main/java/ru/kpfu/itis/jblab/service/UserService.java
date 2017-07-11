package ru.kpfu.itis.jblab.service;

import ru.kpfu.itis.jblab.model.User;

/**
 * Created by Марат on 10.07.2017.
 */
public interface UserService {
    void add(User user);

    void delete(User user);

    User getOne(Long id);
}
