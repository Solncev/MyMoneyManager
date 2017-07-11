package ru.kpfu.itis.jblab.service;

import ru.kpfu.itis.jblab.model.Expense;

/**
 * Created by Марат on 10.07.2017.
 */
public interface ExpenseService {
    void add(Expense expense);

    Expense getByOperationId(Long operationId);

    void delete(Expense expense);
}
