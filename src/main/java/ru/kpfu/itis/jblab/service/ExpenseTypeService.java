package ru.kpfu.itis.jblab.service;

import ru.kpfu.itis.jblab.model.ExpenseType;

import java.util.List;

/**
 * Created by Марат on 10.07.2017.
 */
public interface ExpenseTypeService {
    void add(ExpenseType expenseType);

    void delete(Long id);

    List<ExpenseType> getAllByOwnerId(Long ownerId);

    ExpenseType getOne(Long id);

    ExpenseType update(ExpenseType expenseType);
}
