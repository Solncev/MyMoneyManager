package ru.kpfu.itis.jblab.service;

import ru.kpfu.itis.jblab.model.Debt;

import java.util.List;

/**
 * Created by Марат on 14.07.2017.
 */
public interface DebtService {
    void add(Debt debt);

    List<Debt> getAllByOwnerId(Long ownerId);

    Debt getOne(Long id);

    void delete(Debt debt);

    List<Debt> getAllByAccountId(Long accountId);

    Debt update(Debt debt);
}
