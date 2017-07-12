package ru.kpfu.itis.jblab.service;

import ru.kpfu.itis.jblab.model.Income;

import java.util.List;

/**
 * Created by Марат on 11.07.2017.
 */
public interface IncomeService {
    void add(Income income);

    Income getByOperationId(Long operationId);

    Income update(Income income);

    void delete(Income income);

    List<Income> getAllByIncomeSourceId(Long incomeSourceId);
}
