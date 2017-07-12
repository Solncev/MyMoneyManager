package ru.kpfu.itis.jblab.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.kpfu.itis.jblab.model.IncomeSource;
import ru.kpfu.itis.jblab.repository.IncomeSourceRepository;
import ru.kpfu.itis.jblab.service.IncomeSourceService;

import java.util.List;

/**
 * Created by Марат on 11.07.2017.
 */
@Service
public class IncomeSourceServiceImpl implements IncomeSourceService {
    private final IncomeSourceRepository incomeSourceRepository;

    @Autowired
    public IncomeSourceServiceImpl(IncomeSourceRepository incomeSourceRepository) {
        this.incomeSourceRepository = incomeSourceRepository;
    }

    @Override
    public void add(IncomeSource incomeSource) {
        incomeSourceRepository.save(incomeSource);
    }

    @Override
    public List<IncomeSource> getAllByOwnerId(Long ownerId) {
        return incomeSourceRepository.findAllByOwnerId(ownerId);
    }

    @Override
    public IncomeSource getOne(Long id) {
        return incomeSourceRepository.findOne(id);
    }

    @Override
    public IncomeSource update(IncomeSource incomeSource) {
        return incomeSourceRepository.save(incomeSource);
    }

    @Override
    public void delete(Long id) {
        incomeSourceRepository.delete(id);
    }
}
