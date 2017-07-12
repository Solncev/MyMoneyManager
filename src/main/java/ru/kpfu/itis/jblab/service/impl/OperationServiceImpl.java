package ru.kpfu.itis.jblab.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.kpfu.itis.jblab.model.Operation;
import ru.kpfu.itis.jblab.repository.OperationRepository;
import ru.kpfu.itis.jblab.service.OperationService;

import java.util.List;

/**
 * Created by Марат on 10.07.2017.
 */
@Service
public class OperationServiceImpl implements OperationService {
    private final OperationRepository operationRepository;

    @Autowired
    public OperationServiceImpl(OperationRepository operationRepository) {
        this.operationRepository = operationRepository;
    }

    @Override
    public void add(Operation operation) {
        operationRepository.save(operation);
    }

    @Override
    public List<Operation> getAll() {
        return operationRepository.findAll();
    }

    @Override
    public Operation getOne(Long id) {
        return operationRepository.findOne(id);
    }

    @Override
    public void delete(Operation operation) {
        operationRepository.delete(operation);
    }

    @Override
    public List<Operation> getAllByOwnerId(Long ownerId) {
        return operationRepository.findAllByOwnerId(ownerId);
    }

    @Override
    public List<Operation> getAllByAccountId(Long accountId) {
        return operationRepository.findAllByAccountId(accountId);
    }

    @Override
    public Operation update(Operation operation) {
        return operationRepository.save(operation);
    }
}
