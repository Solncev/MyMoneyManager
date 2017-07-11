package ru.kpfu.itis.jblab.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.kpfu.itis.jblab.model.OperationType;
import ru.kpfu.itis.jblab.repository.OperationTypeRepository;
import ru.kpfu.itis.jblab.service.OperationTypeService;

/**
 * Created by Марат on 10.07.2017.
 */
@Service
public class OperationTypeServiceImpl implements OperationTypeService {
    private final OperationTypeRepository operationTypeRepository;

    @Autowired
    public OperationTypeServiceImpl(OperationTypeRepository operationTypeRepository) {
        this.operationTypeRepository = operationTypeRepository;
    }

    @Override
    public OperationType getByName(String name) {
        return operationTypeRepository.findOneByName(name);
    }
}
