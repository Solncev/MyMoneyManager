package ru.kpfu.itis.jblab.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.kpfu.itis.jblab.model.Expense;
import ru.kpfu.itis.jblab.repository.ExpenseRepository;
import ru.kpfu.itis.jblab.service.ExpenseService;

/**
 * Created by Марат on 10.07.2017.
 */
@Service
public class ExpenseServiceImpl implements ExpenseService {
    private final ExpenseRepository expenseRepository;

    @Autowired
    public ExpenseServiceImpl(ExpenseRepository expenseRepository) {
        this.expenseRepository = expenseRepository;
    }

    @Override
    public void add(Expense expense) {
        expenseRepository.save(expense);
    }

    @Override
    public Expense getByOperationId(Long operationId) {
        return expenseRepository.findByOperationId(operationId);
    }

    @Override
    public void delete(Expense expense) {
        expenseRepository.delete(expense);
    }
}
