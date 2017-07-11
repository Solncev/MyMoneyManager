package ru.kpfu.itis.jblab.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.kpfu.itis.jblab.model.Account;
import ru.kpfu.itis.jblab.repository.AccountRepository;
import ru.kpfu.itis.jblab.service.AccountService;

import java.util.List;

/**
 * Created by Марат on 10.07.2017.
 */
@Service
public class AccountServiceImpl implements AccountService {
    private final AccountRepository accountRepository;

    @Autowired
    public AccountServiceImpl(AccountRepository accountRepository) {
        this.accountRepository = accountRepository;
    }

    @Override
    public void add(Account account) {
        accountRepository.save(account);
    }

    @Override
    public List<Account> getAll() {
        return accountRepository.findAll();
    }

    @Override
    public Account getOne(Long id) {
        return accountRepository.findOne(id);
    }

    @Override
    public void delete(Long id) {
        accountRepository.delete(id);
    }

    @Override
    public Account update(Account account) {
        return accountRepository.save(account);
    }

    @Override
    public List<Account> getAllByOwnerId(Long ownerId) {
        return accountRepository.findAllByOwnerId(ownerId);
    }
}
