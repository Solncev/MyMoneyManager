package ru.kpfu.itis.jblab.service;

import ru.kpfu.itis.jblab.model.Account;

import java.util.List;

/**
 * Created by Марат on 10.07.2017.
 */
public interface AccountService {
    void add(Account account);

    List<Account> getAll();

    Account getOne(Long id);

    void delete(Long id);

    Account update(Account account);

    List<Account> getAllByOwnerId(Long ownerId);
}
