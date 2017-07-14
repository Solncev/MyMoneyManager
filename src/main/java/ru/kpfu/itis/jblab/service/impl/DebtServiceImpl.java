package ru.kpfu.itis.jblab.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.kpfu.itis.jblab.model.Debt;
import ru.kpfu.itis.jblab.repository.DebtRepository;
import ru.kpfu.itis.jblab.service.DebtService;

import java.util.List;

/**
 * Created by Марат on 14.07.2017.
 */
@Service
public class DebtServiceImpl implements DebtService {
    private final DebtRepository debtRepository;

    @Autowired
    public DebtServiceImpl(DebtRepository debtRepository) {
        this.debtRepository = debtRepository;
    }

    @Override
    public void add(Debt debt) {
        debtRepository.save(debt);
    }

    @Override
    public List<Debt> getAllByOwnerId(Long ownerId) {
        return debtRepository.findAllByOwnerId(ownerId);
    }

    @Override
    public Debt getOne(Long id) {
        return debtRepository.findOne(id);
    }

    @Override
    public void delete(Debt debt) {
        debtRepository.delete(debt);
    }

    @Override
    public List<Debt> getAllByAccountId(Long accountId) {
        return debtRepository.findAllByAccountId(accountId);
    }

    @Override
    public Debt update(Debt debt) {
        return debtRepository.save(debt);
    }
}
