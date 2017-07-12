package ru.kpfu.itis.jblab.service;

import ru.kpfu.itis.jblab.model.IncomeSource;

import java.util.List;

/**
 * Created by Марат on 11.07.2017.
 */
public interface IncomeSourceService {
    void add(IncomeSource incomeSource);

    List<IncomeSource> getAllByOwnerId(Long ownerId);

    IncomeSource getOne(Long id);

    IncomeSource update(IncomeSource incomeSource);

    void delete(Long id);
}
