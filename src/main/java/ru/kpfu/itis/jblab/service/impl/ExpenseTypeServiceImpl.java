package ru.kpfu.itis.jblab.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.kpfu.itis.jblab.model.ExpenseType;
import ru.kpfu.itis.jblab.repository.ExpenseTypeRepository;
import ru.kpfu.itis.jblab.service.ExpenseTypeService;

import java.util.List;

/**
 * Created by Марат on 10.07.2017.
 */
@Service
public class ExpenseTypeServiceImpl implements ExpenseTypeService {
    private final ExpenseTypeRepository expenseTypeRepository;

    @Autowired
    public ExpenseTypeServiceImpl(ExpenseTypeRepository expenseTypeRepository) {
        this.expenseTypeRepository = expenseTypeRepository;
    }

    @Override

    public void add(ExpenseType expenseType) {
        expenseTypeRepository.save(expenseType);
    }

    @Override
    public void delete(Long id) {
        expenseTypeRepository.delete(id);
    }

    @Override
    public List<ExpenseType> getAllByOwnerId(Long ownerId) {
        return expenseTypeRepository.findAllByOwnerId(ownerId);
    }

    @Override
    public ExpenseType getOne(Long id) {
        return expenseTypeRepository.findOne(id);
    }
}
