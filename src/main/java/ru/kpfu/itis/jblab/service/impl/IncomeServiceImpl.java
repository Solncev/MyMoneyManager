package ru.kpfu.itis.jblab.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.kpfu.itis.jblab.model.Income;
import ru.kpfu.itis.jblab.repository.IncomeRepository;
import ru.kpfu.itis.jblab.service.IncomeService;

import java.util.List;

/**
 * Created by Марат on 11.07.2017.
 */
@Service
public class IncomeServiceImpl implements IncomeService {
    private final IncomeRepository incomeRepository;

    @Autowired
    public IncomeServiceImpl(IncomeRepository incomeRepository) {
        this.incomeRepository = incomeRepository;
    }

    @Override
    public void add(Income income) {
        incomeRepository.save(income);
    }

    @Override
    public Income getByOperationId(Long operationId) {
        return incomeRepository.findByOperationId(operationId);
    }

    @Override
    public Income update(Income income) {
        return incomeRepository.save(income);
    }

    @Override
    public void delete(Income income) {
        incomeRepository.delete(income);
    }

    @Override
    public List<Income> getAllByIncomeSourceId(Long incomeSourceId) {
        return incomeRepository.findAllByIncomeSourceId(incomeSourceId);
    }
}
